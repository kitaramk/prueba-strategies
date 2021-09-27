import { Injectable } from '@angular/core';
import { HttpClient, HttpHeaders } from '@angular/common/http';
import { Registro } from './registro';
import { Observable} from 'rxjs';

@Injectable({
  providedIn: 'root'
})

export class RegistroService {

  private endpoint: string = "http://localhost:8080/api/registro";
  private httpHeader = new HttpHeaders({'Content-Type':'application/json'});

  constructor(private http: HttpClient) { }

  create(registro: Registro) : Observable<Registro>{
  
    return this.http.post<Registro>(this.endpoint, registro, {headers:this.httpHeader})
  }

}
