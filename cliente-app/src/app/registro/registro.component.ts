import { Component, OnInit } from '@angular/core';
import { Registro } from './registro';
import { PeliculaService } from '../peliculas/pelicula.service';
import { Pelicula } from '../peliculas/pelicula';
import { RegistroService } from './registro.service';
import { Router, ActivatedRoute } from '@angular/router';
import Swal from 'sweetalert2';


@Component({
  selector: 'app-registro',
  templateUrl: './registro.component.html'
})
export class RegistroComponent implements OnInit {

registro: Registro= new Registro;
peliculas: Pelicula[];
pelicula: Pelicula;

  constructor(private registroService: RegistroService,
    private router: Router,
     private peliculaService: PeliculaService) { }

  ngOnInit(): void {
    this.peliculaService.getListPeliculas().subscribe(response => {
      this.peliculas = response as Pelicula[];

      });
  }

public  aplicar(){
  
    this.registroService.create(this.registro).subscribe(
      registro => {this.router.navigate(['/peliculas'])
      Swal.fire('Registrado', 'La accion fue realizada con exito', 'success')
    }

    );
  }

}
