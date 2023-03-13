import { Component, OnInit } from '@angular/core';
import { EncuestaService } from 'src/app/services/encuesta.service';

@Component({
  selector: 'app-sucursal',
  templateUrl: './sucursal.component.html',
  styleUrls: ['./sucursal.component.css']
})
export class SucursalComponent implements OnInit {

  constructor(private encuestaservicio: EncuestaService) { }

  ngOnInit(): void {
    this.encuestaservicio.postProvincia().subscribe(
      res=> console.log(res),
      err=> console.log(err)

    );

  }

}
