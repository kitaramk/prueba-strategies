import { Component, OnInit } from '@angular/core';
import { Pelicula } from './pelicula';
import { PeliculaService } from './pelicula.service';
import { Router, ActivatedRoute  } from '@angular/router';
import  Swal  from 'sweetalert2';

@Component({
  selector: 'app-form',
  templateUrl: './form.component.html'
})
export class FormComponent implements OnInit {
  pelicula: Pelicula = new Pelicula;
  titulo: string = "Crear Pelicula";
  flagView: boolean

  constructor(private peliculaService: PeliculaService,
  private router:Router,
  private activatedRoute: ActivatedRoute) { }

  ngOnInit(): void {
    this.cargarPelicula()
  }

  public create(): void {
    this.peliculaService.create(this.pelicula).subscribe(
      pelicula => {this.router.navigate(['/peliculas'])
      Swal.fire('Nuevo Registro', `Pelicula ${pelicula.titulo} creada con exito`, 'success')
    }

    );
  }

  cargarPelicula(): void{

    this.activatedRoute.params.subscribe(params => {
      let id  = params['id']
      if(id){
        this.peliculaService.getPelicula(id).subscribe( (pelicula) => this.pelicula = pelicula)
      }
    })
  }

  update(): void {
    this.peliculaService.update(this.pelicula).subscribe(

      pelicula => {
        this.router.navigate(['/peliculas'])
        Swal.fire('Registro actualizado', `La Pelicula ${pelicula.titulo} se actualizó con éxito`, 'success')
      }

    )
  }



}
