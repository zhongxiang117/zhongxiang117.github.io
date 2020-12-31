import tkinter as tk

root = tk.Tk()

txt_var = tk.StringVar()
txt_var.set('Knob')
btn = tk.Button(root,text='Button',textvariable=txt_var,
                command=lambda:txt_var.set('')
)

btn.grid(row=0,column=0)
root.mainloop()
