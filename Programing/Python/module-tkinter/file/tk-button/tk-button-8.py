import tkinter as tk

root = tk.Tk()

btn_1 = tk.Button(root,text='FLAT',width=20,height=8,bg='salmon',
    bd=6,relief='flat'
)

btn_2 = tk.Button(root,text='RAISED',width=20,height=8,bg='hotpink',
    bd=6,relief='raised'
)

btn_3 = tk.Button(root,text='SUNKEN',width=20,height=8,bg='limegreen',
    bd=6,relief='sunken'
)

btn_4 = tk.Button(root,text='GROOVE',width=20,height=8,bg='gold',
    bd=6,relief='groove'
)

btn_5 = tk.Button(root,text='RIDGE',width=20,height=8,bg='plum',
    bd=6,relief='ridge'
)


btn_1.grid(row=0,column=0)
btn_2.grid(row=0,column=1)
btn_3.grid(row=0,column=2)
btn_4.grid(row=1,column=0)
btn_5.grid(row=1,column=1)

root.mainloop()
