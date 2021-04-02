// https://www.shuzhiduo.com/A/qVdeEGKndP/

class Solution {
    int count=0;
   public int[] hitBricks(int[][] grid, int[][] hits) {
       int[] ret = new int[hits.length];
       // 先把砖块打掉
       for(int[] hit : hits){
           if(grid[hit[0]][hit[1]] == 1)
               grid[hit[0]][hit[1]] = -1;
       }
       // 贴上最顶层的砖块和与最顶层连接的砖块
       for(int k = 0; k < grid[0].length; ++k){
           if(grid[0][k] == 1){
               isWayToTop(grid, 0, k);
           }
       }
       for(int i = hits.length - 1; i >= 0; --i){
           count = 0;
           //在删掉之前的情况下，如果能保存的话，就恢复此砖块，因为后面可能有和这个砖块有联系的
           //可能导致前面的砖块先over，导致后面的掉了，我们可以把他做恢复模拟
           if(canHit(grid, hits[i][0], hits[i][1]) && grid[hits[i][0]][hits[i][1]] == -1){
               isWayToTop(grid, hits[i][0], hits[i][1]);
               ret[i] = count - 1;
           }
       }
       return ret;
   }
   public void isWayToTop(int[][] grid, int i, int j){
       grid[i][j] = 2;
       ++ count;
       if (i + 1 < grid.length  && grid[i + 1][j] == 1) {
           isWayToTop(grid,  i + 1, j);
       }
       if (j + 1 < grid[0].length &&  grid[i][j + 1] == 1) {
           isWayToTop(grid,  i, j + 1);
       }
       if (i-1>=0&& grid[i - 1][j] == 1) {
           isWayToTop(grid, i - 1, j);
       }
       if (j - 1 >= 0 &&  grid[i][j - 1] == 1) {
           isWayToTop(grid, i, j - 1);
       }
   }
   public boolean canHit(int [][] grid,int i,int j){
       if(i == 0)
           return true;
       if (i + 1 < grid.length  && grid[i + 1][j] == 2) {
           return true;
       }
       if (j + 1 < grid[0].length &&  grid[i][j + 1] == 2) {
           return true;
       }
       if (i - 1 >= 0 && grid[i - 1][j] == 2) {
           return true;
       }
       if (j - 1 >= 0 &&  grid[i][j - 1] == 2) {
           return true;
       }
       if(grid[i][j] == -1)
           grid[i][j] = 1;
       return false;
   }
}