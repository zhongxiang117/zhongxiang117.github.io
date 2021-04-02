class Solution(object):
    def hitBricks(self, grid, hits):
        """
        :type grid: List[List[int]]
        :type hits: List[List[int]]
        :rtype: List[int]
        """
        m = len(grid)
        n = len(grid[0])
        color = [[None] * n for _ in range(m)]

        for x, y in hits:
            grid[x][y] -= 1

        now = 0
        q = []
        cnt = []
        for j in range(n):
            if grid[0][j] == 1:
                color[0][j] = now
                q.append([0, j])
        self.bfs(q, m, n, grid, color, now, cnt)
        now += 1

        for i in range(1, m):
            for j in range(n):
                if grid[i][j] == 1 and color[i][j] is None:
                    color[i][j] = now
                    q = [[i, j]]
                    self.bfs(q, m, n, grid, color, now, cnt)
                    now += 1
        
        fa = [x for x in range(now)]
        res = []
        hits.reverse()
        dx = [0, 1, 0, -1]
        dy = [1, 0, -1, 0]

        for nowx, nowy in hits:
            if grid[nowx][nowy] == 0:
                drop = set()
                for index in range(4):
                    x = nowx + dx[index]
                    y = nowy + dy[index]
                    if x >= 0 and x < m and y >= 0 and y < n and grid[x][y] == 1:
                        drop.add(color[x][y])

                grid[nowx][nowy] = 1
                tmp = 0
                if nowx == 0:
                    min_fa = 0
                else:
                    min_fa = now
                drop_fa_set = set()
                for drop_color in drop:
                    drop_fa = self.find(drop_color, fa)
                    min_fa = min(min_fa, drop_fa)
                    if drop_fa != 0 and drop_fa not in drop_fa_set:
                        tmp += cnt[drop_fa]
                        drop_fa_set.add(drop_fa)
                
                if min_fa == 0:
                    res.append(tmp)
                    color[nowx][nowy] =0
                else:
                    res.append(0)
                    color[nowx][nowy] = min_fa
                    if min_fa == now:
                        fa.append(min_fa)
                        cnt.append(tmp + 1)
                        now += 1
                    else:
                        cnt[min_fa] = tmp + 1

                for drop_fa in drop_fa_set:
                    fa[drop_fa] = min_fa
                
            else:
                res.append(0)

        res.reverse()
        return res

    def find(self, drop_color, fa):
        if fa[drop_color] != drop_color:
            tmp = self.find(fa[drop_color], fa)
            fa[drop_color] = tmp

        return fa[drop_color]

    def bfs(self, q, m, n, grid, color, now, cnt):
        dx = [0, 1, 0, -1]
        dy = [1, 0, -1, 0]
        l = 0
        r = len(q)
        while l < r:
            nowx, nowy = q[l]
            l += 1
            for index in range(4):
                x = nowx + dx[index]
                y = nowy + dy[index]
                if x > 0 and x < m and y >=0 and y < n and grid[x][y] == 1 and color[x][y] is None:
                    color[x][y] = now
                    q.append([x, y])
                    r += 1
        
        cnt.append(len(q))
