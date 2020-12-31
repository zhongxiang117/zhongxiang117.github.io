import tkinter as tk

root = tk.Tk()

btn_1 = tk.Button(root,
        text='Button 1',
        width=50,
        height=10,
        anchor='w',
        bg='cyan'
)

btn_2 = tk.Button(root,
        text='Button 2',
        padx=50,
        pady=50,
        anchor='w',
        bg='bisque'
)

btn_1.grid(row=0,column=0)
btn_2.grid(row=1,column=0)
root.mainloop()
