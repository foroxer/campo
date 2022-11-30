namespace Models
{
    public enum PermissionsEnum
    {
        //para cada uno debe existir un registro en BD
        Default,//este permiso lo tiene por default todo el mundo sin tener que agregarselo 
        PatentesFamilias,
        PatentesUsuarios,
        Usuarios,
        VerRutina,
        ConfigIdioma,
        ConfigurarEjercicios,
        AsignarEjercicios,
        Backup,
        Restore,
        DVRecalc,
        ChangesControl,
        Bitacora,
        Coupons,
        Venta,
        Reports
    }
}
