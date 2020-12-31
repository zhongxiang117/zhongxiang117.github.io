import tkinter as tk

root = tk.Tk()

btn_1 = tk.Button(root,
        text='Button 1',
        width=50,
        height=10,
        bg='cyan',
        bd='6',
)

btn_2 = tk.Button(root,
        text='Button 2',
        bg='bisque',
        fg='red'
)


btn_1.grid(row=0,column=0)
btn_2.grid(row=1,column=0)
root.mainloop()
