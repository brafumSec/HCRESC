#include<stdio.h>
#include<string.h>
#include<stdbool.h>
#include <time.h>




#define maxn 30
#define maxm 500


//using namespace std;
//const int maxn=30;
//const int maxm=500;
int n;//有效字母数
int G[maxn][maxn];
int vis[maxn];
int ans[maxn];
int cnt;
int counter = 0;
int mark[maxn];//标记当前字母出现在变量中
int ok(int i,int cnt)//如果在ans[0,cnt-1]出现了一个本应在i后面才出现的字母,那么返回false
{
    for(int j=0;j<cnt;j++)
        if(G[i][ans[j]]) return 0;
    return 1;
}
void dfs(int cnt)
{
    if(cnt==n)
    {
        for(int i=0;i<n;i++)
            printf("%c",ans[i]+'A');
        printf("\n");
        counter++;
    }
    else for(int i=0;i<26;i++)if(mark[i]&&!vis[i]&&ok(i,cnt))
    {
        vis[i]=1;
        ans[cnt]=i;
        dfs(cnt+1);
        vis[i]=0;
    }
}
int main()
{
    
    time_t start, end;
    char str[1000];
    puts("input the node (such as A C D F):  \n");

    while(gets(str))
    {
        n=0;
        memset(mark,0,sizeof(mark));
        memset(G,0,sizeof(G));
        memset(vis,0,sizeof(vis));
        for(int i=0;str[i];i++)if(str[i]!=' ')
            mark[str[i]-'A']=1, n++;
        puts("input the edge (such as AC CB DF):  \n");
        gets(str);
 	
	start = time(NULL);
  	printf(": = %ld\n", start);


        for(int i=0;str[i];i++)if(str[i]!=' ')
        {
            int a,b;
            a=str[i++]-'A';
            while(str[i]==' ')
                i++;
            b=str[i]-'A';
            G[a][b]=1;
        }
        puts("all the results:  \n");
        dfs(0);//表示当前正在构造第0个位置
        printf("total results:%d\n",counter);


	end = time(NULL);
  	printf(": = %ld\n", end);
	printf("time overhead = %ld\n", start-end);

        puts("\n\n\nplease input new DAG:\n");
    }
    return 0;
}
