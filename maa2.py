x =input('input : ')
if not x.isdigit():
    print('Output: Error')
num =[]
priNum =[]

for i in range(1,x+1):
    if x%i==0 :
       num.append(i)

print(f'number : ')
print(f'prime number : ')