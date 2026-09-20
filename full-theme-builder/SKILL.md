---
name: full-theme-builder
description: Centralized theme and design token system. DEFAULT LOGIC: Always use the 'Default/Teal' palette for general UI. THEME TRIGGER: Only switch to elemental palettes (Earth, Sky, Fire, Spirit, Eden, Covenant, Stone) when specifically called for by project name or user prompt. INHERITANCE: All themes must strictly follow the Typography and Icon sets defined below.
---

# 📐 Global Design Tokens

### Typography
| Type | Size | Weight | Usage |
| :--- | :--- | :--- | :--- |
| **Hero** | 0 | Bold (`700`) | Large impact displays |
| **Header** | 20 | Bold (`700`) | Page/Section headers |
| **Title** | 17 | Bold (`700`) | Component/Card titles |
| **Subtitle** | 14 | Semi-Bold (`600`) | Supporting headings |
| **Label** | 15 | Normal (`400`) | Form labels/Metadata |
| **Body** | 13 | Normal (`400`) | Standard text |
| **BodyBold** | 13 | Medium (`500`) | Emphasized body |
| **CaptionBold** | 11 | Semi-Bold (`600`) | Micro-copy/Legal |
| **Caption** | 11 | Normal (`400`) | Micro-copy/Legal |

### Icons
* **Priority:** Material Community Icons (`@mdi/js`).

---

# 🎨 Theme Data Definitions

```javascript
const themeDefinitions = {
  // === DEFAULT (Teal System) ===
  default: {
    light: {
      primary: '#00BFA5', secondary: '#0073ed', background: '#bbbfc6', 
      surface: '#e5e5ea', text: '#0065d1', primaryText: '#00251A', 
      secondaryText: '#ffffff', success: '#00C853', error: '#d92f20', 
      warning: '#FFD600', accentPrimary: '#0b0904', accentPrimaryText: '#e9a846', 
      accentSecondary: '#e5e5ea', accentSecondaryText: '#000000', 
      shadow: 'rgba(0, 0, 0, 0.2)', highlight: 'rgba(255, 255, 255, 0.45)',
      star1: '#fcffac', star2: '#ffffff', star3: '#7aedfc'
    },
    dark: {
      primary: '#00BFA5', secondary: '#006ce0', background: '#141415', 
      surface: '#2c2c2f', text: '#268ffe', primaryText: '#00251A', 
      secondaryText: '#ffffff', success: '#00C853', error: '#d93d2f', 
      warning: '#FFD600', accentPrimary: '#0b0904', accentPrimaryText: '#e9a846', 
      accentSecondary: '#171717', accentSecondaryText: '#e5e5ea', 
      shadow: 'rgba(0, 0, 0, 0.93)', highlight: 'rgba(255, 255, 255, 0.11)',
      star1: '#fdffb9', star2: '#ffffff', star3: '#63e5f6'
    }
  },
  earth: {
    light: {
      primary: '#5D4037', secondary: '#F4D06F', background: '#F3E5D0', surface: '#FDFBF7', text: '#4E342E', primaryText: '#FFFFFF',
      success: '#388E3C', error: '#D32F2F', warning: '#FFA000',
      accentPrimary: '#8D6E63', accentSecondary: '#FFECB3', neutral: '#2C2C2C',
      shadow: 'rgba(166, 143, 119, 0.5)', highlight: 'rgba(255, 255, 255, 0.9)',
    },
    dark: {
      primary: '#FFFFFF', secondary: '#FFD700', background: '#352822', surface: '#262626', text: '#FFFFFF', primaryText: '#352822',
      success: '#81C784', error: '#E57373', warning: '#FFD54F',
      accentPrimary: '#A1887F', accentSecondary: '#FFC107', neutral: '#424242',
      shadow: 'rgba(0, 0, 0, 0.8)', highlight: 'rgba(255, 255, 255, 0.1)',
    }
  },
  sky: {
    light: {
      primary: '#0277BD', secondary: '#FFAB00', background: '#E1F5FE', surface: '#FFFFFF', text: '#01579B', primaryText: '#FFFFFF',
      success: '#00C853', error: '#D50000', warning: '#FFD600',
      accentPrimary: '#4FC3F7', accentSecondary: '#FFF59D', neutral: '#546E7A',
      shadow: 'rgba(129, 165, 186, 0.5)', highlight: 'rgba(255, 255, 255, 1)',
    },
    dark: {
      primary: '#81D4FA', secondary: '#FFD700', background: '#0A1929', surface: '#102A43', text: '#E1F5FE', primaryText: '#0A1929',
      success: '#69F0AE', error: '#FF5252', warning: '#FFFF00',
      accentPrimary: '#29B6F6', accentSecondary: '#FFAB00', neutral: '#78909C',
      shadow: 'rgba(0, 0, 0, 0.9)', highlight: 'rgba(255, 255, 255, 0.15)',
    }
  },
  fire: {
    light: {
      primary: '#D32F2F', secondary: '#FFEB3B', background: '#FFEBEE', surface: '#FFFFFF', text: '#B71C1C', primaryText: '#FFFFFF',
      success: '#388E3C', error: '#D32F2F', warning: '#FFA000',
      accentPrimary: '#EF5350', accentSecondary: '#FFF59D', neutral: '#BF360C',
      shadow: 'rgba(239, 83, 80, 0.4)', highlight: 'rgba(255, 255, 255, 0.9)',
    },
    dark: {
      primary: '#EF5350', secondary: '#FFF176', background: '#6A2424', surface: '#4E1A1A', text: '#FFCDD2', primaryText: '#4E1A1A',
      success: '#81C784', error: '#E57373', warning: '#FFD54F',
      accentPrimary: '#E57373', accentSecondary: '#FFF59D', neutral: '#BF360C',
      shadow: 'rgba(0, 0, 0, 0.8)', highlight: 'rgba(255, 255, 255, 0.1)',
    }
  },
  spirit: {
    light: {
      primary: '#FFA000', secondary: '#FFD600', background: '#FFF8E1', surface: '#FFFFFF', text: '#FF6F00', primaryText: '#212121',
      success: '#388E3C', error: '#D32F2F', warning: '#FFA000',
      accentPrimary: '#FFCA28', accentSecondary: '#FFF176', neutral: '#FF8F00',
      shadow: 'rgba(255, 202, 40, 0.5)', highlight: 'rgba(255, 255, 255, 0.9)',
    },
    dark: {
      primary: '#FFCA28', secondary: '#FFF176', background: '#423315', surface: '#302510', text: '#FFF8E1', primaryText: '#302510',
      success: '#81C784', error: '#E57373', warning: '#FFD54F',
      accentPrimary: '#FFD54F', accentSecondary: '#FFF59D', neutral: '#FFB300',
      shadow: 'rgba(0, 0, 0, 0.8)', highlight: 'rgba(255, 255, 255, 0.1)',
    }
  },
  eden: {
    light: {
      primary: '#2E7D32', secondary: '#C0CA33', background: '#E8F5E9', surface: '#FFFFFF', text: '#1B5E20', primaryText: '#FFFFFF',
      success: '#1B5E20', error: '#BF360C', warning: '#F9A825',
      accentPrimary: '#66BB6A', accentSecondary: '#DCE775', neutral: '#455A64',
      shadow: 'rgba(102, 187, 106, 0.4)', highlight: 'rgba(255, 255, 255, 0.9)',
    },
    dark: {
      primary: '#A5D6A7', secondary: '#AED581', background: '#1B5E20', surface: '#003300', text: '#E8F5E9', primaryText: '#1B5E20',
      success: '#4CAF50', error: '#FF6E40', warning: '#FFEE58',
      accentPrimary: '#81C784', accentSecondary: '#C0CA33', neutral: '#37474F',
      shadow: 'rgba(0, 0, 0, 0.8)', highlight: 'rgba(255, 255, 255, 0.1)',
    }
  },
  covenant: {
    light: {
      primary: '#4527A0', secondary: '#FFD600', background: '#EDE7F6', surface: '#FFFFFF', text: '#311B92', primaryText: '#FFFFFF',
      success: '#388E3C', error: '#D32F2F', warning: '#FFA000',
      accentPrimary: '#7E57C2', accentSecondary: '#FFF176', neutral: '#4527A0',
      shadow: 'rgba(126, 87, 194, 0.4)', highlight: 'rgba(255, 255, 255, 0.9)',
    },
    dark: {
      primary: '#B39DDB', secondary: '#FFFF00', background: '#281E42', surface: '#1A142D', text: '#EDE7F6', primaryText: '#281E42',
      success: '#81C784', error: '#E57373', warning: '#FFD54F',
      accentPrimary: '#9575CD', accentSecondary: '#FFF59D', neutral: '#4527A0',
      shadow: 'rgba(0, 0, 0, 0.8)', highlight: 'rgba(255, 255, 255, 0.1)',
    }
  },
  stone: {
    light: {
      primary: '#424242', secondary: '#BDBDBD', background: '#F5F5F5', surface: '#FFFFFF', text: '#212121', primaryText: '#FFFFFF',
      success: '#388E3C', error: '#D32F2F', warning: '#FFA000',
      accentPrimary: '#757575', accentSecondary: '#E0E0E0', neutral: '#616161',
      shadow: 'rgba(97, 97, 97, 0.4)', highlight: 'rgba(255, 255, 255, 0.9)',
    },
    dark: {
      primary: '#E0E0E0', secondary: '#757575', background: '#212121', surface: '#333333', text: '#FFFFFF', primaryText: '#212121',
      success: '#81C784', error: '#E57373', warning: '#FFD54F',
      accentPrimary: '#9E9E9E', accentSecondary: '#616161', neutral: '#424242',
      shadow: 'rgba(0, 0, 0, 0.8)', highlight: 'rgba(255, 255, 255, 0.1)',
    }
  }
};

const createTheme = (colors) => ({
  ...colors,
  placeholder: `${colors.text}66`,
  disabled: `${colors.text}33`,
  border: `${colors.text}1A`,
  inputBackground: colors.surface,
});