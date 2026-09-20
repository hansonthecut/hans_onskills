---
name: videogen
description: Autonomous end-to-end marketing video production engine. Orchestrates generative AI video takes (Gemini Omni/Veo), authentic app screen and 3D mascot image plates, broadcast-grade kinetic typography, and synchronized master audio beds. Trigger with /videogen or videogen.
---

Produce vertical marketing videos (9:16 portrait) combining AI video takes, authentic application screens, and official mascot assets.

---

## EXECUTION DIRECTIVES

- **Zero Fake Stamped Overlays**: Strictly prohibit crude 2D rectangle boxes, flat shapes, or amateur system font stamps over static photos.
- **100% App Screen Fidelity**: App UI screens must maintain complete visual fidelity to the real application. Never accept hallucinated AI interface mockups when real screens exist in the repository or `dev-assets`.
- **Official Character & Mascot Assets**: Source official 3D characters and mascots directly from `dev-assets`. Never fabricate arbitrary characters when brand assets are established.
- **Browser Automation & Account Access**: Leverage `visualtest` to connect to or launch the dedicated Chrome automation instance on port `9222`. Ensure navigation explicitly targets the user's authenticated Google Ultra account (profile handle configured via `GOOGLE_ULTRA_PROFILE` or the active profile with the Ultra tier badge at `https://gemini.google.com/videos`). Do not duplicate browser launch mechanics or credentials.
- **Organized Storage**: Isolate all raw takes, cut segments, audio tracks, and previews within a dedicated run directory: `<project>/generations/<campaign_name>_v<N>/`. Copy the finalized master MP4 to `<project>/<project_video_name>.mp4`.

---

## THE VIDEOGEN PRODUCTION PIPELINE

Execute the following phases sequentially:

### PHASE 1: STORYBOARD & NARRATIVE ARCHITECTURE
1. **Retention Pacing**: Target 15–22 seconds for optimal short-form algorithmic loops (TikTok, Instagram Reels, YouTube Shorts).
2. **UGC 4-Act Structure**:
   - **Act I: The Hook (0.0s - 4.5s)**: Energetic creator in context (e.g. car driver seat, gym, track) addressing a specific user pain point with strong facial kinetics.
   - **Act II: The Real Demo (4.5s - 9.0s)**: First-person POV of hands holding the smartphone, clearly showcasing the actual app screen.
   - **Act III: The Mascot Feature (9.0s - 14.5s)**: Brand mascot demonstrating dynamic features (e.g. exercise reps, statutory altitude adjustments).
   - **Act IV: The Payoff & CTA (14.5s - 21.0s)**: Creator celebration (thumbs up, nod, wink), official score payoff badge, and clean app download call to action.
3. **Voiceover & Audio Design**:
   - Draft script using natural operator cadence (`/humanize`).
   - Synthesize high-fidelity voiceover (e.g. Google Cloud TTS conversational voice at 1.15x–1.20x speed).
   - Extract exact timestamps (`t1`, `t2`, `t3`, `t4`) for seamless multi-shot visual synchronization.
   - Mix tactile haptic sound effects (clicks, whooshes, ambient room thud, victory chime) ducked over an energetic 120BPM music bed.

### PHASE 2: GENERATIVE VIDEO TAKES (GEMINI OMNI / VEO)
1. **Attach via CDP**:
   - Connect via Chrome DevTools Protocol (`http://127.0.0.1:9222/json`) to the active Ultra profile tab at `https://gemini.google.com/videos` using Node.js built-in `WebSocket`.
2. **Force 9:16 Aspect Ratio**:
   - Verify the UI selector is set to `Portrait (9:16)` prior to submission.
3. **Policy-Compliant Prompt Engineering**:
   - Avoid sensitive military jargon or trigger keywords that activate safety filters.
   - Focus on visual descriptors: clothing, environment, lighting, natural friendly expressions, and vlog creator kinetics.
4. **Reactive Completion Polling**:
   - Monitor the video generation state asynchronously without aggressive polling loops.
   - Once generation finishes, extract the video URL from the DOM.
5. **Authenticated MP4 Ingestion**:
   - Fetch the video blob inside the browser execution context (`fetch(src, { credentials: 'include' })`) and stream to disk as raw takes (e.g. `shot1_raw.mp4`, `shot3_raw.mp4`).

### PHASE 3: SCREEN & MASCOT IMAGE GEN PIPELINE
1. **Source Asset Resolution**:
   - Locate actual app screenshots in the project (e.g. `apps/mobile/assets/store/` or `dev-assets/<project>/screens/`).
   - Locate official high-resolution 3D mascot assets in `dev-assets/<project>/mascot/`.
2. **Photorealistic Scene Generation**:
   - Use `generate_image` passing the real screen and mascot images as explicit `ImagePaths` references.
   - Generate:
     - **Handheld Demo Plate**: Real hands holding a modern smartphone naturally, embedding the exact app screen with authentic perspective and glass glare.
     - **Mascot Feature Plates**: Official 3D mascot situated in cinematic, contextual environments (e.g. hangar pushups, high-altitude mountain base).
3. **Strict QC Inspection**:
   - Visually inspect every generated plate with `view_file` to confirm screen legibility and mascot fidelity before moving to post-production.

### PHASE 4: CINEMATIC MOTION & COMPOSITING
1. **Sub-Pixel Camera Dynamics**:
   - Apply smooth sub-pixel camera zooms (Ken Burns push-in from `1.0x` to `1.15x`) and subtle organic handheld sway to static plates.
2. **High-Aesthetic Kinetic Typography**:
   - Use clean, modern typography with soft drop shadows and high-contrast accents (White, Cyan `#00F0FF`, Amber `#FFB300`, Pass Green `#00E676`).
   - Avoid solid opaque rectangle blocks that obscure screen or face content.
   - Prevent font rendering glyph errors by omitting raw emojis on unsupported system font paths.
3. **Interactive Visual Feedback**:
   - Add subtle touch ripples or glowing accents on UI elements synchronized to voiceover mentions (e.g. slider touch at mention of specific numbers).
4. **Seamless Cut Transitions**:
   - Time scene cuts to exact audio beat transitions (`t1` to `t4`).
   - Use subtle directional motion blur or whip transitions across cuts.

### PHASE 5: ASSEMBLY & RENDER (FFMPEG)
1. **Piped Video Rendering**:
   - Read video frames via FFmpeg pipe (`imageio_ffmpeg`), apply overlays in Python (NumPy / PIL), and pipe composite frames back into FFmpeg.
2. **Container & Codec Optimization**:
   - Master at `720x1280` or `1080x1920` (9:16 vertical), 24 or 30 FPS.
   - Encode with H.264 high profile (`-preset fast`, `-crf 17-18`, `-pix_fmt yuv420p`).
   - Encode audio with AAC at `192k`.
   - Apply `-shortest` and container flags to ensure web streaming playback readiness.

### PHASE 6: VERIFICATION & AUDIT
1. **Visual QC**:
   - Use `view_file` to watch the rendered MP4 file from start to finish.
   - Verify that facial lip sync, gestures, screen focus, mascot framing, and audio cuts are aligned.
2. **Audio Waveform Validation**:
   - Confirm audio tracks are present, peak levels are balanced, and no clipping occurs.
3. **Master Promotion**:
   - Verify final master video exists in project root for immediate stakeholder access.

### PHASE 7: REPORT BACK TO USER
Report back to the user concisely.
