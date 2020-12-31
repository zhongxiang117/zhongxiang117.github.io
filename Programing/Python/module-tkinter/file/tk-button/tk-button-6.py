import tkinter as tk

root = tk.Tk()

btn = tk.Button(root,
        text='Button in line 1\nAnother text in line 2\nAdditional info in line 3',
        width=50,
        height=10,
        justify=tk.LEFT
)

btn.grid(row=0,column=0)
root.mainloop()
