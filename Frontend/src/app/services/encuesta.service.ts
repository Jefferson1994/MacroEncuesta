import { Injectable } from '@angular/core';
import { HttpClient} from '@angular/common/http';

@Injectable({
  providedIn: 'root'
})
export class EncuestaService {

  constructor(private http: HttpClient) { }


  postProvincia(){
    return this.http.post('https://localhost:51824/api/Catalogos',{codigo:1, tipo:'provincias'});
  }
}
