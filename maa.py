print('hello world!')

def water(a,tax):
    return a

x = int(input('input number : '))
crrX =0

if x > 0:
    print(f'ใช้ไป {x} หน่วยจ่าย 50 ' ,end='')
    crrX = x
    
    if x>10:
        print('+ %d '%(10 * 5),end='')
        crrX = crrX- 10
    else:
        print('+ %d '%(crrX * 5),end='')
        crrX =0
    # 11-20
    if crrX != 0:
        if crrX>10:
            print('+ %d '%(10 * 10),end='')
            crrX = crrX- 10
        else:
            print('+ %d '%(crrX * 10),end='')
            crrX =0
    # 21-30
    if crrX != 0:
        if crrX>10:
            print('+ %d '%(10 * 30),end='')
            crrX = crrX-10
        else:
            print('+ %d '%(crrX * 30),end='')
            crrX =0
    # 31++ 
    if crrX > 0 :
        print(f'+ {crrX * 50} ', end='')
    
    print(' บาท')
else:
    print('ใช้ไป 0 หน่วยจ่าย 50 บาท')