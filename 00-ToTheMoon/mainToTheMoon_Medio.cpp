#define BLANDO_MAX 4 
#define DURO_MIN 7
#define ALTA_POROSIDAD_MIN 70
#define BAJA_POROSIDAD_MAX 45 


#include <iostream>
using namespace std;

enum Suelos {Piedra, Polvo, Medio, Desconocido};


Suelos definirDureza(uint dureza, uint porosidad){
	if(dureza < BLANDO_MAX && porosidad > ALTA_POROSIDAD_MIN){	
		return Polvo;
	}
	else if(dureza > DURO_MIN && porosidad < BAJA_POROSIDAD_MAX){
		return Piedra;
	}else if(dureza < DURO_MIN && dureza > BLANDO_MAX && porosidad > BAJA_POROSIDAD_MAX && porosidad < ALTA_POROSIDAD_MIN){
		return Medio;
	}else{
		return Desconocido;
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
	Suelos suelo = definirDureza(dureza, porosidad);
	if(suelo == Piedra){
		moverBrazo(150, true, 10);
		cerrarPinza();
		moverBrazo(150, false, 10);
		cout << "Muestra piso duro obtenida" << endl;
	}else if(suelo == Polvo){
		moverBrazo(100, false, 5);
		cerrarPinza();
		moverBrazo(100, true, 5);
		cout << "Muestra piso blando obtenida" << endl;
	}else if(suelo == Medio){
		moverBrazo(150, true, 5);
		cerrarPinza();
		moverBrazo(100, false, 10);
		cout << "Muestra piso medio obtenida" << endl;
	}else{
		cout << "Error de muestreo: piso no identificado" << endl;
	}

}

int main(){

	uint dureza, porosidad;
	cin >> dureza >> porosidad; 
	lunarRover(dureza,porosidad);
	return 0;
}