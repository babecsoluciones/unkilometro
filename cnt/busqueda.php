<? session_start(); ?>
				<!-- product left -->
				<div class="col-lg-3 mt-lg-0 mt-4 p-lg-0">
					<div class="side-bar p-sm-4 p-3">
					    <form id="Datos" method="post">
						<!-- price -->
						<div class="range border-bottom py-2">
							<h3 class="agileits-sear-head mb-3">Precio</h3>
							<div class="w3l-range">
                            <input type="number" name="dPrecioMin" id="dPrecioMin" value="200000" min="0" max="1000000" class="col-md-5" onchange="filtrar();">
                            <input type="number" name="dPrecioMax" id="dPrecioMax" value="700000" min="0" max="1000000" class="col-md-6" onchange="filtrar();">
							</div>
						</div>
						<!-- //price -->
						<!-- discounts -->
						<div class="left-side border-bottom py-2">
							<h3 class="agileits-sear-head mb-3">Estado</h3>
							<input type="text" id="tEstado" name="tEstado" class="form-control" placeholder="Estado" onkeyup="buscarEstado();" onkeypress="buscarEstado();" value="<?=(($_SESSION['sesionEstado']) ? $_SESSION['sesionEstado']['tNombre'] :'');?>" onchange="filtrar();">
							<input type="hidden" id="eCodEstado" name="eCodEstado" value="<?=(($_SESSION['sesionEstado']) ? $_SESSION['sesionEstado']['eCodEstado'] :'');?>">
							<small>Seleccione un elemento de la lista</small>
						</div>
						<!-- //discounts -->
						<!-- discounts -->
						<div class="left-side border-bottom py-2">
							<h3 class="agileits-sear-head mb-3">Nombre</h3>
							<input type="text" id="tTitulo" name="tTitulo" class="form-control" placeholder="Nombre" value="<?=(($_POST['tBusqueda']) ? $_POST['tBusqueda'] : '');?>" onchange="filtrar();">
							
						</div>
						<!-- //discounts -->
						<!-- discounts -->
						<div class="left-side border-bottom py-2">
							<h3 class="agileits-sear-head mb-3">A&ntilde;o</h3>
							<input type="text" id="eAnio" name="eAnio" class="form-control" placeholder="Año" onchange="filtrar();">
							
						</div>
						<!-- //discounts -->
						<!-- discounts -->
						<div class="left-side border-bottom py-2">
							<h3 class="agileits-sear-head mb-3">Marca</h3>
							<input type="text" id="tMarca" name="tMarca" class="form-control" placeholder="Marca" onchange="filtrar();" onkeyup="buscarMarca();" onkeypress="buscarMarca();">
							<input type="hidden" id="eCodMarca" name="eCodMarca">
							<small>Seleccione un elemento de la lista</small>
						</div>
						<!-- //discounts -->
						<!-- discounts -->
						<div class="left-side border-bottom py-2">
							<h3 class="agileits-sear-head mb-3">Tipo</h3>
							<input type="text" id="tTipo" name="tTipo" class="form-control" placeholder="Tipo" onchange="filtrar();" onkeyup="buscarTipo();" onkeypress="buscarTipo();">
							<input type="hidden" id="eCodTipo" name="eCodTipo">
							<small>Seleccione un elemento de la lista</small>
						</div>
						<!-- //discounts -->
						<!-- electronics -->
						<div class="left-side border-bottom py-2">
							<h3 class="agileits-sear-head mb-3">Cilindros</h3>
                            <input type="number" class="form-control" name="eCilindros" id="eCilindros" value="4" min="1" max="16" onchange="filtrar();">
						</div>
						<!-- //electronics -->
						<!-- electronics -->
						<div class="left-side border-bottom py-2">
							<h3 class="agileits-sear-head mb-3">Mostrar</h3>
                            <label><input type="checkbox" id="bLote" name="bLote" value="1" onclick="filtrar();"> Solo lotes de autos</label>
						</div>
						<!-- //electronics -->
						<!-- electronics -->
						<div class="left-side border-bottom py-2">
							<h3 class="agileits-sear-head mb-3">Ordenar</h3>
                            <select id="rdOrdenar" name="rdOrdenar" class="form-control">
                                <option value="">Seleccione...</option>
                                <option value="eCodPublicacion DESC">Más recientes primero</option>
                                <option value="eCodPublicacion ASC">Más antiguos primero</option>
                                <option value="dPrecio DESC">Más baratos primero</option>
                                <option value="dPrecio ASC">Más caros primero</option>
                            </select>
						</div>
						<!-- //electronics -->
						<!-- electronics -->
						<div class="left-side border-bottom py-2">
							<h3 class="agileits-sear-head mb-3" id="tPagina">P&aacute;gina 1</h3>
                            <nav aria-label="Page navigation example">
                              <ul class="pagination">
                                <li class="page-item page-link" style="text-align: center;" onclick="pagina('P');">Anterior</li>
                                <li class="page-item page-link" style="text-align: center;" onclick="pagina('N');">Siguiente</li>
                              </ul>
                            </nav>
						</div>
						<!-- //electronics -->
						
						
                    
						<input type="hidden" id="ePagina" name="ePagina" value="1">
						</form>
					</div>
					<!-- //product right -->
				</div>
				<!-- //product left -->

				<!-- product right -->
				<div class="agileinfo-ads-display col-lg-9">
					<div class="wrapper">
						<!-- first section -->
						<div class="product-sec1 px-sm-4 px-3 py-sm-5  py-3 mb-4">
							<h3 class="heading-tittle text-center font-italic">Autos <img src="/images/spinner.gif" height="25" id="imgLoading" style="display:none;"></h3>
							<div class="row" id="divXHR">
								<div class="col-md-4 product-men mt-5">
									<div class="men-pro-item simpleCart_shelfItem">
										<div class="men-thumb-item text-center">
											<img src="images/m1.jpg" alt="" class="img-responsive" width="100%">
											<div class="men-cart-pro">
												<div class="inner-men-cart-pro">
													<a href="#" class="link-product-add-cart">Ver m&aacute;s</a>
												</div>
											</div>
										</div>
										<div class="item-info-product text-center border-top mt-4">
											<h4 class="pt-1">
												<a href="#">Nissan SENTRA 2018</a>
											</h4>
											<div class="info-product-price my-2">
												<span class="item_price">$200,000.00</span>
												
											</div>
											
										</div>
									</div>
								</div>
							    <div class="col-md-4 product-men mt-5">
									<div class="men-pro-item simpleCart_shelfItem">
										<div class="men-thumb-item text-center">
											<img src="images/m1.jpg" alt="" class="img-responsive" width="100%">
											<div class="men-cart-pro">
												<div class="inner-men-cart-pro">
													<a href="#" class="link-product-add-cart">Ver m&aacute;s</a>
												</div>
											</div>
										</div>
										<div class="item-info-product text-center border-top mt-4">
											<h4 class="pt-1">
												<a href="#">Nissan SENTRA 2018</a>
											</h4>
											<div class="info-product-price my-2">
												<span class="item_price">$200,000.00</span>
												
											</div>
											
										</div>
									</div>
								</div>
								<div class="col-md-4 product-men mt-5">
									<div class="men-pro-item simpleCart_shelfItem">
										<div class="men-thumb-item text-center">
											<img src="images/m1.jpg" alt="" class="img-responsive" width="100%">
											<div class="men-cart-pro">
												<div class="inner-men-cart-pro">
													<a href="#" class="link-product-add-cart">Ver m&aacute;s</a>
												</div>
											</div>
										</div>
										<div class="item-info-product text-center border-top mt-4">
											<h4 class="pt-1">
												<a href="#">Nissan SENTRA 2018</a>
											</h4>
											<div class="info-product-price my-2">
												<span class="item_price">$200,000.00</span>
												
											</div>
											
										</div>
									</div>
								</div>
								<div class="col-md-4 product-men mt-5">
									<div class="men-pro-item simpleCart_shelfItem">
										<div class="men-thumb-item text-center">
											<img src="images/m1.jpg" alt="" class="img-responsive" width="100%">
											<div class="men-cart-pro">
												<div class="inner-men-cart-pro">
													<a href="#" class="link-product-add-cart">Ver m&aacute;s</a>
												</div>
											</div>
										</div>
										<div class="item-info-product text-center border-top mt-4">
											<h4 class="pt-1">
												<a href="#">Nissan SENTRA 2018</a>
											</h4>
											<div class="info-product-price my-2">
												<span class="item_price">$200,000.00</span>
												
											</div>
											
										</div>
									</div>
								</div>
								<div class="col-md-4 product-men mt-5">
									<div class="men-pro-item simpleCart_shelfItem">
										<div class="men-thumb-item text-center">
											<img src="images/m1.jpg" alt="" class="img-responsive" width="100%">
											<div class="men-cart-pro">
												<div class="inner-men-cart-pro">
													<a href="#" class="link-product-add-cart">Ver m&aacute;s</a>
												</div>
											</div>
										</div>
										<div class="item-info-product text-center border-top mt-4">
											<h4 class="pt-1">
												<a href="#">Nissan SENTRA 2018</a>
											</h4>
											<div class="info-product-price my-2">
												<span class="item_price">$200,000.00</span>
												
											</div>
											
										</div>
									</div>
								</div>
								<div class="col-md-4 product-men mt-5">
									<div class="men-pro-item simpleCart_shelfItem">
										<div class="men-thumb-item text-center">
											<img src="images/m1.jpg" alt="" class="img-responsive" width="100%">
											<div class="men-cart-pro">
												<div class="inner-men-cart-pro">
													<a href="#" class="link-product-add-cart">Ver m&aacute;s</a>
												</div>
											</div>
										</div>
										<div class="item-info-product text-center border-top mt-4">
											<h4 class="pt-1">
												<a href="#">Nissan SENTRA 2018</a>
											</h4>
											<div class="info-product-price my-2">
												<span class="item_price">$200,000.00</span>
												
											</div>
											
										</div>
									</div>
								</div>
							</div>
						</div>
						<!-- //first section -->
						
					</div>
				</div>
				<!-- //product right -->
			