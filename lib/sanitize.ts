export function lamSachChuoi(value: string) {
  return value.replace(/[<>]/g, '').trim();
}
