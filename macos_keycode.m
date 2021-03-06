
#import "macos_keycode.h"
#import <rime/key_table.h>


int osx_modifiers_to_rime_modifiers(unsigned modifiers) 
{
  int ret = 0;
  
  if (modifiers & OSX_CAPITAL_MASK)
    ret |= kLockMask;
  if (modifiers & OSX_SHIFT_MASK)
    ret |= kShiftMask;
  if (modifiers & OSX_CTRL_MASK)
    ret |= kControlMask;
  if (modifiers & OSX_ALT_MASK)
    ret |= kAltMask;
  if (modifiers & OSX_COMMAND_MASK)
    ret |= kSuperMask;
  
  return ret;
}

int osx_keycode_to_rime_keycode(int keycode, int keychar, int shift, int caps)
{
  int ret = 0;
  
  switch (keycode) {
    case OSX_VK_SPACE:
      ret = XK_space;
      break;
    case OSX_VK_TAB:
      ret = XK_Tab;
      break;
    case OSX_VK_ENTER:
      ret = XK_Return;
      break;
    case OSX_VK_BACK_SPACE:
      ret = XK_BackSpace;
      break;
    case OSX_VK_ESCAPE:
      ret = XK_Escape;
      break;
    case OSX_VK_PAGE_UP:
      ret = XK_Prior;
      break;
    case OSX_VK_PAGE_DOWN:
      ret = XK_Next;
      break;
    case OSX_VK_END:
      ret = XK_End;
      break;
    case OSX_VK_HOME:
      ret = XK_Home;
      break;
    case OSX_VK_LEFT:
      ret = XK_Left;
      break;
    case OSX_VK_UP:
      ret = XK_Up;
      break;
    case OSX_VK_RIGHT:
      ret = XK_Right;
      break;
    case OSX_VK_DOWN:
      ret = XK_Down;
      break;
    case OSX_VK_DELETE:
      ret = XK_Delete;
      break;
    case OSX_VK_CONTROL_L:
      ret = XK_Control_L;
      break;
    case OSX_VK_CONTROL_R:
      ret = XK_Control_R;
      break;
    case OSX_VK_SHIFT_L:
      ret = XK_Shift_L;
      break;
    case OSX_VK_SHIFT_R:
      ret = XK_Shift_R;
      break;
    case OSX_VK_ALT:
      ret = XK_Alt_L;
      break;
    default:
      /* NOTE:
       * IBus/Rime use different keycodes for uppercase/lowercase letters.
       */
      if ((!!shift != !!caps) && keychar >= 'a' && keychar <= 'z') {
        keychar -= 'a' - 'A';
      }
      if (keychar >= 0x20 && keychar <= 0x7e) {
        ret = keychar;
      }
      else if (keychar == 0x1b) {  // ^[
        ret = XK_bracketleft;
      }
      else if (keychar == 0x1c) {  // ^\
        ret = XK_backslash;
      }
      else if (keychar == 0x1d) {  // ^]
        ret = XK_bracketright;
      }
      else if (keychar == 0x1f) {  // ^_
        ret = XK_minus;
      }
      break;
  }
  
  return ret;
}

