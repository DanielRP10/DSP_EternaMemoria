<%-- 
    Document   : sidebar
    Created on : 24 nov 2024, 12:38:20?a. m.
    Author     : macma
--%>
<nav class="sidebar d-flex flex-column vh-100">
    <!-- Encabezado -->
    <div class="sidebar-header text-white text-center py-3">
        <h4>Panel Administrativo</h4>
    </div>
    
    <!-- Menú -->
    <div class="sidebar-menu flex-grow-1 overflow-auto ">
        <!-- Controles -->
        <div class="menu-section" id="section-controles">
            <div class="menu-section-title p-3">Controles</div>
            <a href="ControladorClientes?accion=listar" class="menu-item p-3">
                <i class='bx bx-user'></i> Clientes
            </a>
            <a href="ControladorVendedores?accion=listar" class="menu-item p-3">
                <i class='bx bx-user-minus'></i> Vendedores
            </a>
            
           <a href="ControladorContrato?accion=listarContrato" class="menu-item p-3">
                <i class='bx bx-task'></i> Contrato
            </a>
            <a href="ControladorProductos?accion=listar" class="menu-item p-3">
                <i class='bx bx-box'></i> Productos
            </a>
            <a href="ControladorInventarios?accion=listar" class="menu-item p-3">
                <i class='bx bx-building'></i> Inventarios
            </a>
            <a href="ControladorPlan?accion=listarPlan" class="menu-item p-3">
                <i class='bx bx-detail'></i> Plan
            </a>
            <a href="ControladorDetallePlan?accion=listarDetallePlan" class="menu-item p-3">
                <i class='bx bx-detail'></i> Detalle Plan
            </a>
        </div>

        <!-- Operaciones -->
        <div class="menu-section" id="section-operaciones">
            <div class="menu-section-title p-3">Operaciones</div>
            <!--
            <div class="menu-item dropdown">
                
                <a href="#" class="menu-item-toggle p-3" id="ventas-toggle">
                    <i class='bx bx-cart'></i> Ventas <i class='bx bx-chevron-down ms-auto'></i>
                </a>
                <div class="dropdown-content ps-3" id="ventas-submenu">
                    <a href="ControladorVendedores?accion=listar" class="menu-item">Vendedores</a>
                    <a href="ControladorVentas?accion=listar" class="menu-item">Ventas</a>
                    <a href="ControladorDetallesVentas?accion=listar" class="menu-item">Detalles de Ventas</a>
                    <a href="ControladorPlan?accion=listarPlan" class="menu-item">Plan</a>
                    <a href="ControladorDetallePlan?accion=listarDetallePlan" class="menu-item">Detalle del Plan</a>
                </div>
            </div>-->
            <a href="ControladorVentas?accion=listar" class="menu-item p-3">
                <i class='bx bx-purchase-tag'></i> Ventas
            </a>
            <a href="ControladorDetallesVentas?accion=listar" class="menu-item p-3">
                <i class='bx bx-purchase-tag'></i> Detalles de Ventas
            </a>
            <a href="ControladorCompras?accion=listar" class="menu-item p-3">
                <i class='bx bx-shopping-bag'></i> Compras
            </a>
            <a href="ControladorDetallesCompra?accion=listar" class="menu-item p-3">
                <i class='bx bx-shopping-bag'></i> Detalles de Compras
            </a>
            
            <a href="ControladorCuentaPago?accion=listarCuentaPago" class="menu-item p-3">
                <i class='bx bx-dollar'></i> Pago
            </a>
            
             <a href="ControladorReservacion?accion=listarReservacion" class="menu-item p-3">
                <i class='bx bx-category'></i> Reservaciones
            </a>
            
        </div>

        <!-- Informes -->
        <div class="menu-section" id="section-informes">
            <div class="menu-section-title p-3">Informes</div>
            <a href="vistas/reporteVentas.jsp" class="menu-item p-3">
                <i class='bx bx-line-chart'></i> Informe de Ventas
            </a>
            <a href="vistas/reporteContratos.jsp" class="menu-item p-3">
                <i class='bx bx-task'></i> Informe de Contratos
            </a>
            <a href="vistas/reportePagos.jsp" class="menu-item p-3">
                <i class='bx bx-spreadsheet'></i> Estado de Cuenta
            </a>
            <a href="vistas/reporteClientes.jsp" class="menu-item p-3">
                <i class='bx bx-line-chart'></i> Informe Clientes
            </a>
            
            
        </div>

        <!-- Especiales -->
        <div class="menu-section" id="section-especiales">
            <div class="menu-section-title p-3">Especiales</div>
            
            <a href="ControladorUsuarioCRUD?accion=listarUsuario" class="menu-item p-3">
                <i class='bx bx-user'></i> Usuario
            </a>
            
        </div>

        <!-- Ayuda -->
        <div class="menu-section" id="section-ayuda">
            <div class="menu-section-title p-3">Acerca de</div>
            
            <a href="vistas/acercaDe.jsp" class="menu-item p-3">
                <i class='bx bx-info-circle'></i> Acerca de 
            </a>
        </div>
    </div>

    <!-- Pie de página -->
    <div class="sidebar-footer bg-secondary text-white text-center py-2">
        <small>&copy; 2024 Eterna Memoria</small>
    </div>
</nav>

<script>
    document.querySelectorAll('.menu-section-title').forEach(title => {
        title.addEventListener('click', () => {
            const section = title.parentElement;
            section.classList.toggle('show');
        });
    });

    document.getElementById('ventas-toggle').addEventListener('click', function (e) {
        e.preventDefault();
        const submenu = document.getElementById('ventas-submenu');
        submenu.classList.toggle('show');
    });
</script>
