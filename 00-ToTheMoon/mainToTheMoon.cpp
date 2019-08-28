#define BLANDOMAX 4 
#define DUROMIN 7
#define ALTAPOROSIDADMIN 70
#define BAJAPOROSIDADMAX 45 


using namespace std;

enum{Piedra, Polvo}


enum definirDureza(dureza, porosidad){
	if(dureza < 4 && porosidad > 70){
		return 
	}
}

void moverBrazo(int rpm, bool sentidoReloj, int tiempo){
	//Acá iría el código para comunicarse con el brazo
	return;
}

void cerrarPinza(){
	//Acá iría el código para comunicarse con la pinza
	return;
}

void lunarRover(uint dureza, uint porosidad){
	enum suelo = definirDureza(dureza, porosidad);
	if(suelo == Piedra){
		moverBrazo(150, true, 10);
		cerrarPinza();
		moverBrazo(150, false, 10);
	}else if(suelo == Polvo){
		moverBrazo(100, false, 5);
		cerrarPinza();
		moverBrazo(100, true, 5);
	}

}

int main(){

	uint dureza, porosidad;
	uint cantidadSuelos;
	cin >> cantidadSuelos;
	while(cantidadSuelos > 0){
		cin >> dureza >> porosidad; 
		lunarRover(dureza,porosidad);
		cantidadSuelos--;
	}
	
	return 0;
}