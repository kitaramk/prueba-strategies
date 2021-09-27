import { Injectable } from '@angular/core';
import { Pelicula } from './pelicula';
import { Observable} from 'rxjs';
import { HttpClient, HttpHeaders } from '@angular/common/http';
import { map } from 'rxjs/operators';

@Injectable({
  providedIn: 'root'
})
export class PeliculaService {

private endpoint: string = "http://localhost:8080/api/peliculas";
private httpHeader = new HttpHeaders({'Content-Type':'application/json'});
  constructor( private http: HttpClient) { }

  getPeliculas(page: number) : Observable<any>{

    return this.http.get(this.endpoint+'/page/'+page).pipe(
      map( (response:any) => {
        (response.content as Pelicula[]).map(pelicula  => {
          pelicula.titulo = pelicula.titulo.toUpperCase();
          return pelicula;
        });
        return response;
      })
    );
  }

  create(pelicula: Pelicula) : Observable<Pelicula>{
    return this.http.post<Pelicula>(this.endpoint, pelicula, {headers:this.httpHeader})
  }

  getPelicula(id: number): Observable<Pelicula> {
      return this.http.get<Pelicula>(`${this.endpoint}/${id}`)
  }

  update(pelicula: Pelicula): Observable<Pelicula>{
    return this.http.put<Pelicula>(`${this.endpoint}/${pelicula.id}`, pelicula,{headers: this.httpHeader})
  }

  delete(id: number): Observable<Pelicula>{
    return this.http.delete<Pelicula>(`${this.endpoint}/${id}`, {headers:this.httpHeader})
  }

  subirImagen(archivo: File, id) : Observable<Pelicula>{
    let formData = new FormData();
    formData.append("foto",archivo);
    formData.append("id",id);
    return this.http.post(`${this.endpoint}/upload/`, formData).pipe(
        map((response: any) => response.pelicula as Pelicula)
    );
  }

getListPeliculas() : Observable<Pelicula[]>{

  return   this.http.get(this.endpoint).pipe(
      map( (response) => response as Pelicula[] )
    );
}

}
