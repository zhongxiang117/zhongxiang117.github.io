import tkinter as tk

root = tk.Tk()

btn = tk.Button(root,text='Button',
                padx=50,
                pady=10
)

btn.grid(row=0,column=0)
root.mainloop()
