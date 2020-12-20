---
---

# Block All Programs from Internet Connections Under Given Folder

I happen to find a very useful video: [youtube-video-block-program](https://www.youtube.com/watch?v=4AH4SV7bGN0)


## Situation:

sometimes, we do not want specific program to connect internet at any circumstances, and we know this type of blockage can be done by setting the firewall `in/out` bound rules.

however, it is inconvenient and time consuming if we want to add many different executors.

especially, when we don't have a sense that for which executor that we want to block.

therefore, the simple solution is to shutdown the entire folder from internet accessing.

then we can predefine a rule, for example, any file with an extension `exe`, will be added to the blacklist.


so, here comes to the `bat` scripts.

This is my script: [block-entire-folder-from-internet-connection](../scripts/../../Scripts/block-internet-connections.bat)



