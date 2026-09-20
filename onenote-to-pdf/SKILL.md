---
name: onenote-to-pdf
description: Export Microsoft OneNote notebooks and section files (.one, .onetoc2) to high-fidelity, optimized PDF documents with hierarchical bookmarks and table of contents. Trigger with /onenote-to-pdf or whenever exporting OneNote notebooks to PDF.
---

## Instructions

Convert OneNote notebooks and `.one` section files into individual section PDFs and a unified, optimized master PDF with hierarchical outline bookmarks, outputting to `$HOME/Downloads/gitProjects/personal`.

---

### Phase 1: Context Gathering & Hierarchy Ordering

1. **Identify Input Source:**
   - Infer or retrieve target notebook directory or `.one` / `.onetoc2` paths from the user prompt.
2. **Set Target Output:** 
   - Root target directory: `$HOME/Downloads/gitProjects/personal/sources/[category]` (e.g. `undergrad/`, `gradschool/`, `misc/`).
   - Intermediate section PDFs: Saved under `[target_folder]/Exported_PDFs/[Notebook_Name]/`.
   - Master PDF: `[target_folder]/[Notebook_Name].pdf`.
3. **Catalog & Natural Sort:**
   - Scan all subdirectories in the user's input source for `.one` section files.
   - Ignore `OneNote_RecycleBin` and empty `Untitled Section.one` files (< 30 KB).
   - Apply natural sorting to sections and section groups (e.g. Orientation, Binders, Units, Lectures, Labs, Assignments, Exams).

---

### Phase 2: Environment & Process Pre-Flight

1. **Verify Python Environment:**
   - Ensure Python has `pywin32` and `PyMuPDF` (`fitz`) installed (`python -c "import win32com.client, fitz"`).
2. **Clean Up Zombie OneNote Instances:**
   - Terminate stale background `-Embedding` instances before starting:
     ```powershell
     Get-CimInstance Win32_Process -Filter "name = 'ONENOTE.EXE'" | Where-Object { $_.CommandLine -like "*-Embedding*" } | ForEach-Object { Stop-Process -Id $_.ProcessId -Force }
     ```
   - Ensure OneNote Desktop is running in the user's interactive session. If OneNote shows a startup crash dialog, ensure it is set to "Start Normally".

---

### Phase 3: Autonomous Interactive Execution

> [!IMPORTANT]
> Because background agent subshells execute in an isolated desktop window station, direct COM calls to `OneNote.Application.12` from the subshell may hang or fail with `CO_E_SERVER_EXEC_FAILURE` (`-2146959355`) or `Operation unavailable` (`-2147221021`).
>
> To run the conversion completely autonomously without requiring manual user execution, register and launch an interactive Scheduled Task:

```powershell
$action = New-ScheduledTaskAction -Execute "C:\Python313\python.exe" -Argument "C:\path\to\convert_script.py" -WorkingDirectory "C:\WorkingDir"
$principal = New-ScheduledTaskPrincipal -UserId "$env:USERDOMAIN\$env:USERNAME" -LogonType Interactive
$task = Register-ScheduledTask -TaskName "RunOneNoteConvert" -Action $action -Principal $principal -Force
Start-ScheduledTask -TaskName "RunOneNoteConvert"
```

Monitor the task and directory output periodically until completed, then clean up:
```powershell
Unregister-ScheduledTask -TaskName "RunOneNoteConvert" -Confirm:$false
```

---

### Phase 4: Robust Section-by-Section Export Pipeline

> [!IMPORTANT]
> Never attempt to export an entire large notebook directory or `.onetoc2` in a single COM call. OneNote RPC consistently crashes or runs out of memory on multi-section notebooks. Always export section-by-section.

1. **Section Export Loop:** For each `.one` file:
   - Call `obj_id = onenote.OpenHierarchy(section_file_path, "", 0)`.
   - Call `onenote.Publish(obj_id, target_pdf_path, 3, "")` (`3` corresponds to `PublishFormat.pfPDF`).
2. **Transient Error & Memory Recovery:**
   - For large sections (>200 MB), OneNote may hit memory limits and restart.
   - Wrap section exports in a retry loop (up to 3 retries). On exception, sleep 2 seconds, re-dispatch `OneNote.Application.12`, and retry.
   - If a section fails after 3 retries, log the failure and proceed with the remaining sections so the overall batch is not blocked.

---

### Phase 5: Hierarchical Merge & PDF Optimization

1. **Build Hierarchical Table of Contents (TOC):**
   - Track 1-based page offsets across merged documents.
   - Construct a nested outline structure using PyMuPDF format:
     ```python
     # [level, title, page_number]
     toc.append([level, group_title, current_page])
     toc.append([sec_level, section_title, current_page])
     ```
   - Apply bookmarks: `merged_doc.set_toc(toc)`.
2. **Apply Stream & Resource Optimization:**
   - Save the master document using PyMuPDF's optimization flags:
     ```python
     merged_doc.save(
         master_pdf_path,
         garbage=4,
         deflate=True,
         deflate_images=True,
         deflate_fonts=True,
         clean=True,
     )
     ```
   - Do NOT pass `linear=True` (linearisation is deprecated in modern MuPDF).

---

### Phase 6: Verification & Reporting
1. **Audit & Verification:** Verify master PDF page counts and TOC entries with PyMuPDF before declaring completion.
2. **Output:** Provide a clean Markdown table summarizing notebook names, page counts, compressed file sizes, bookmark counts, and clickable `file://` links. Report back to the user concisely.
