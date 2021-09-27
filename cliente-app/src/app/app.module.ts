import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';

import { AppComponent } from './app.component';
import { HeaderComponent} from './header/header.component';
import { RouterModule } from '@angular/router';
import { HttpClientModule } from '@angular/common/http';
import { FormComponent } from './peliculas/form.component';
import { FormsModule } from '@angular/forms';
import { PeliculasComponent } from './peliculas/peliculas.component';
import { PeliculaService } from './peliculas/pelicula.service';
import { PaginatorComponent } from './paginator/paginator.component';
import { DetalleComponent } from './peliculas/detalle/detalle.component';
import { RegistroComponent } from './registro/registro.component';
import { RegistroService } from './registro/registro.service';



const appRoutes =  [
    {path:'', redirectTo:'/peliculas', pathMatch: 'full'},
    {path:'peliculas', component: PeliculasComponent},
    {path:'peliculas/page/:page', component: PeliculasComponent},
    {path:'pelicula/form', component: FormComponent},
    {path:'pelicula/form/:id', component: FormComponent},
    {path:'pelicula/detalle/:id', component: DetalleComponent},
    {path:'registro', component: RegistroComponent},
];

@NgModule({
  declarations: [
    AppComponent,
    HeaderComponent,
    FormComponent,
    PeliculasComponent,
    PaginatorComponent,
    DetalleComponent,
    RegistroComponent
  ],
  imports: [
    BrowserModule,
    HttpClientModule,
    FormsModule,
    RouterModule.forRoot(appRoutes)
  ],
  providers: [RegistroService,
    PeliculaService

  ],
  bootstrap: [AppComponent]
})
export class AppModule { }
