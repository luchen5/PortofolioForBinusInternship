import java.util.Random;

public class Map {

	Random rand = new Random();
	
	char[][] map = new char[25][25];
	
	public Map() {
		initializeMap();
		bsp(0,24,0,24,true);
		map[0][2]=' ';
	}
	
	public void initializeMap(){
		for(int i=0;i<25;i++){
			for(int j=0;j<25;j++){
				if(i==0 || j==0 || i==24 || j==24)
					map[i][j] = '#';
				else
					map[i][j] = ' ';
			}
		}
	}
	
	public void printMap(){
		for(int i=0;i<25;i++){
			for(int j=0;j<25;j++){
				System.out.print(map[i][j]);
			}
			System.out.println();
		}
	}
	
	public boolean checkPlayer(int y , int x) {
		if(map[y][x]!=' ') return false;
		else return true;
	}
	
	public void resetPlayer(int y, int x){
		map[y][x] = ' ';
	}
	
	public void setPlayer(int y, int x){
		map[y][x] = '*';
	}
	
	public void bsp(int x1, int x2, int y1, int y2, boolean vert){
		if((x2-x1) < 14 && (y2-y1) < 14)	return;
		
		int wall;
		boolean notright = true;
		// vertical
		if(vert){
			if((x2-x1) < 14){
				bsp(x1, x2, y1, y2, false);
				return;
			}
			// limiter
			do{
				wall = (int)Math.floor(Math.random()*((x2-6 - 1) - (x1+6 + 1)) + x1+6 + 1);
				
				if(map[y1][wall] != ' ' && map[y2][wall] != ' ')
					notright = false;
				
			}while(notright);
			
			// door
			int door;
			do{
				door = (int)Math.floor(Math.random()*(y2-y1-1) + y1+1);
			}while(door == (y1+7) || door == (y2-7));
			
			for(int i=y1+1;i<y2;i++){
				if(i != door)
					map[i][wall] = '#';
			}
			
			bsp(x1, wall, y1, y2, false);
			bsp(wall, x2, y1, y2, false);
		}else{
			// horizontal
			if((y2-y1) < 14){
				bsp(x1, x2, y1, y2, true);
				return;
			}
			do{
				wall = (int)Math.floor(Math.random()*((y2-6 - 1) - (y1+6 + 1)) + y1+6 + 1);

				if(map[wall][x1] == '#' && map[wall][x2] == '#')
					notright = false;
				
			}while(notright);
			
			int door;
			do{
				door = (int)Math.floor(Math.random()*(x2-x1-1) + x1+1);
			}while(door == x1+7 || door == x2-7);
			
			for(int i=x1+1;i<x2;i++){
				if(i != door)
					map[wall][i] = '#';
			}
			
			bsp(x1, x2, y1, wall, true);
			bsp(x1, x2, wall, y2, true);
		}
	}	

}
