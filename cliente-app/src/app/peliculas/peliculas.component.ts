import { Component, OnInit } from '@angular/core';
import { Pelicula } from './pelicula';
import { PeliculaService } from './pelicula.service';
import { Router, ActivatedRoute } from '@angular/router';
import Swal from 'sweetalert2';


@Component({
  selector: 'app-peliculas',
  templateUrl: './peliculas.component.html'
})
export class PeliculasComponent implements OnInit {

  peliculas:  Pelicula[] ;
  paginator: any;
  flagView: boolean = true;
  constructor( private peliculaService: PeliculaService,
  private router: Router,
  private activateRoute: ActivatedRoute) { }

  ngOnInit(): void  {

    this.activateRoute.paramMap.subscribe( params => {
          let page: number = +params.get('page');
          if(!page){
            page =0;
          }

          this.peliculaService.getPeliculas(page).subscribe(response => {
            this.peliculas = response.content as Pelicula[];
            this.paginator = response;
            });
        });
  }

  delete(pelicula: Pelicula): void {
    Swal.fire({
      title: 'Esta seguro ?',
      text: `¿Seguro que desea elimiar la pelicula ${pelicula.titulo}?`,
      icon: 'warning',
      showCancelButton: true,
      confirmButtonColor: '#3085d6',
      cancelButtonColor: '#d33',
      confirmButtonText: 'Si, Eliminar!'
    }).then((result) => {
      if (result.isConfirmed) {

        this.peliculaService.delete(pelicula.id).subscribe(
          pelicula => {
            this.peliculas = this.peliculas.filter(peli => peli !== pelicula)
            Swal.fire(
              'Eliminado!',
              'La pelicula se eliminó con éxito',
              'success'
            )
          }
        )

      }
    })
  }

  ver(pelicula: Pelicula): void {

      this.peliculaService.getPelicula(pelicula.id).subscribe( (pelicula) => {
      pelicula = pelicula
      this.router.navigate(['/pelicula/form'])
        this.flagView = false;
    })


  }



}
