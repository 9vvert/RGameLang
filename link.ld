ENTRY(start)

SECTIONS
{
  /* 强制起始地址为 0x0 */
  . = 0x0;

  /* 将启动代码放在最前面，之后拼接普通 .text */
  .text : ALIGN(4)
  {
    KEEP(*(.text.start))   /* 保证 start 所在的小节不会被丢弃并放到最前 */
    *(.text*)              /* 包括 .text, .text.foo 等所有 text 小节 */
    *(.init)               /* 如果需要，把 .init 也放进去 */
  }

  /* 可选：如果你不想其它段进入 ELF，直接丢弃，或者显式放映射它们 */
  /DISCARD/ : { *(.eh_frame) *(.comment) }

  /* 末尾符号（可选） */
  _end = .;
}
