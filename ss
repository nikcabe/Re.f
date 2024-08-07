'''
7 8
1 2 1 3 2 4 2 5 4 6 5 6 6 7 3 7
'''
def DFS(s,v):                       # s시작정점, V 정점개수(1번부터인 정점의 마지막 정점)
    visited = [0]*(v+1)             #방문한 정점을 예시
    stack = []                      #스택생성
    print(s)
    visited[s] = 1                  #시작정점 방문표시
    v = s
    while True:
        for w in adjL[v]:            # v 에 인접하고, 방문안한 w가 있다면
            if visited[w] == 0:
                stack.append(v)     # push(v) 현재 정점을 push하고
                v = w               # w에 방문
                print(v)
                visited[w] = 1      # w에 방문 표시
                break               # for w, v부터 다시 탐색
        else:                       # 남은 인접정점이 없어서 break가 걸리지 않는 경우
            if stack:               # 이전 갈림길을 스택에서 꺼내서... if top > -1
                v = stack.pop()
            else:   #되돌아갈 곳이 없으면 남은 갈림길이 없으면 탐색종료
                break


T = int(input())
for tc in range(1,1+T):
    v, e = map(int, input().split())
    adjL = [[] for _ in range(v+1)]
    arr = list(map(int, input().split()))

    for i in range(e):
        v1,v2 = arr[i*2], arr[i*2+1]
        adjL[v1].append(v2)
        adjL[v2].append(v1)
    DFS(1,v)
