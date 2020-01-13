#include <iostream>
#include <vector>
#include <random>
#include <fstream>
using namespace std;

int main() {
	ofstream out;
	out.open("SortidaGenerador.pddl");

	std::random_device randomDevice;
	std::mt19937 eng(randomDevice()); 
	std::uniform_int_distribution<> distr(1, 15); 
	int libros = distr(eng);  
	vector<string> vectorLibro (libros);
	out << "(define (problem Generador) (:domain planificador)" << endl;
	out << "		(:objects ";	
	for(int i = 0; i < libros; ++i) {
    	string aux = "";	
    	string Libro = "l";
    	aux.append(Libro);
    	vectorLibro[i] = aux.append(to_string(i));
    	out <<	vectorLibro[i] << " ";	
	}	
	out << "- libro" << endl;
	out << "		         ";
	vector<string> mes (vectorLibro.size() + 1);
	for(int i = 0; i < vectorLibro.size()+1; ++i) 
    {
    	string aux = "";	
    	string aux3 = "m";
    	aux.append(aux3);
    	mes[i] = aux.append(to_string(i));
    	out <<	mes[i] << " ";	
	}
	out << "- mes)" << endl;
	out << "(:init" << endl;
	int libros_ = libros;
	int i = 0;
	int m = 0;
	vector<int> comptador_prede(vectorLibro.size(), 0);
	while(i < vectorLibro.size() and libros_ != 0) 
    {
		m = 0;
		std::uniform_int_distribution<> dista(1, libros_); 
		std::uniform_int_distribution<> rand(1, dista(eng));
		int series = dista(eng);
		libros_ = libros_ - series;
		int j = 0;
		if(series == 2 and i == 0) {
			out << "(predecesor " << vectorLibro[i] << " " << vectorLibro[i+1] << ")" << endl;
			++comptador_prede[i+1];
			++i;
			j = j + 2;
		}
		while(j+1 != series and series != 1 and series != 2) 
        {
			if(i == rand(eng) or j == rand(eng) and j < 1) 
            {
			++i; ++j;
			m = 0;
			}
			else
            {
				out << "(predecesor " << vectorLibro[i] << " " << vectorLibro[i+1] << ")" << endl;
				++comptador_prede[i+1];
				++j;
				++i;
			}
			
		} 
	}
	std::uniform_int_distribution<> ds(1, libros); 
	int lectura = ds(eng); 
    
	std::uniform_int_distribution<> ds1(1, libros); 
	int LibroLeido = ds1(eng); 
	
	vector<string> ver (lectura);
    
	for(i = 0; i < lectura; ++i)
    {
		std::random_device randomDevice;
		std::mt19937 eng(randomDevice()); 
		std::uniform_int_distribution<> distr(1, LibroLeido);
		int verr = distr(eng) - 1; 
		out << "(leer " << vectorLibro[verr] << ")" << endl;
		ver[i] = vectorLibro[verr];
	}
	for(i = 0; i < mes.size(); ++i)
    {
		out << "(= (orden " << mes[i] << ") " << i<< ")" << endl;
	}
	for(i = 0; i < vectorLibro.size(); ++i)
    {
		out << "(= (ultimoMes " << vectorLibro[i] << ") " << 0 << ")" << endl;
	}
	for(i = 0; i < mes.size(); ++i)
    {
		out << "(= (paginasLibrosLeidas " << mes[i] << ") " << 0 << ")" << endl;
	}
		for(i = 0; i < vectorLibro.size(); ++i)
        {
            out << "(= (paginasMes " << vectorLibro[i] << ") " << 0 << ")" << endl;
	}

	out << ")" << endl;
	out << endl;
	out << " (:goal (and (forall (?x - libro) (not (leer ?x))))))" << endl;
}
