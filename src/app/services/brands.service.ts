import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';

@Injectable({
  providedIn: 'root'
})
export class BrandsService {
 baseUrl = `https://ecommerce.routemisr.com/api/v1`
  constructor(private _HttpClient:HttpClient) { }
  getAllBrands():Observable<any>{
    return this._HttpClient.get(`${this.baseUrl}/brands`)
  }
}