import { Component, OnInit } from '@angular/core';
import { Pelicula } from '../pelicula';
import { PeliculaService } from '../pelicula.service';
import { ActivatedRoute, Router } from '@angular/router';
import Swal from 'sweetalert2';


@Component({
  selector: 'detalle-pelicula',
  templateUrl: './detalle.component.html'
})
export class DetalleComponent implements OnInit {

pelicula: Pelicula;
titulo: string = "detalle de la pelicula";
private imagenSelected: File;
  constructor(private peliculaService: PeliculaService,
    private activateRouter: ActivatedRoute,
    private router : Router
   ) { }

  ngOnInit(): void {

    this.activateRouter.paramMap.subscribe( params => {
      let id: number = +params.get("id");
      if(id){
        this.peliculaService.getPelicula(id).subscribe( pelicula => {
          this.pelicula = pelicula;
        });
      }
    });
  }

  seleccionar(event){
    this.imagenSelected = event.target.files[0];
    if(this.imagenSelected.type.indexOf('image') < 0){
      Swal.fire('Error al seleccionar imagen, el archivo debe de ser imagen ', 'error')
    }
  }

  subirImagen(){
    if(!this.imagenSelected){
      Swal.fire('Erro al cargar imagen','error');
    }else{

    this.peliculaService.subirImagen(this.imagenSelected,this.pelicula.id).subscribe(
      pelicula => {
        this.pelicula = pelicula;
        Swal.fire('La foto se carga exitosamente','success');
      }
    )
  }
  }

}
