## vim-enum-to-string

<!-- vim-markdown-toc GFM -->

- [Intro](#intro)
- [Install](#install)
- [Usage](#usage)
- [FeedBack](#feedback)

<!-- vim-markdown-toc -->

### Intro

Sometimes I wish to log enums as strings instead of their integer value in
order to make debugging easier (especially for newcommers to a project).

This plugin defines a new command which, when executed on the beginning of a
c++ enum declaration, will generate a function body that will receive the 
enum as an input parameter and return a stringified version of that enum.

### Install

- vim-plug

```vim
Plug 'chris2schill/vim-enum-to-string'
```

### Usage

This plugin defines two commands

This plugin defines two new text objects. These are very similar - they differ
only in whether they include the line below the block or not.

| Key bindings                          | Description                                                        |
| ------------------------------------- | ------------------------------------------------------------------ |
| `EnumToString`                        | Generates the enum_to_string function                              |
| `EnumToStringCreateCaseStatement`     | Converts an enum into a case statement that returns it as a string |

```vim
enum day_of_week
{
    MONDAY,
    TUESDAY,
    WEDNESDAY,
    THURSDAY,
    FRIDAY,
    SATURDAY,
    SUNDAY,
};
```

becomes

```vim
template<>
std::string enum_to_string(day_of_week e)
{
switch(e)
{
    case TUESDAY: return "TUESDAY";
    case WEDNESDAY: return "WEDNESDAY";
    case THURSDAY: return "THURSDAY";
    case FRIDAY: return "FRIDAY";
    case SATURDAY: return "SATURDAY";
    case SUNDAY: return "SUNDAY";
}
return "Compiler should not let you get here.";
};
```

### FeedBack

vim-indent-object was written by Chris Schilling <chris2schill@gmail.com>. The
project repository is kept at:

http://github.com/chris2schill/vim-enum-to-string

Any feedback or criticism is welcome, and can be mailed to the author at the
above email address. Alternatively issues can be raised on the project
website.
