module cam_cpl_indices
  
  use seq_flds_mod
  use mct_mod
  use seq_drydep_mod,    only: drydep_fields_token, lnd_drydep
  use shr_megan_mod,     only: shr_megan_fields_token, shr_megan_mechcomps_n
  use shr_fire_emis_mod, only: shr_fire_emis_fields_token, shr_fire_emis_ztop_token, &
                               shr_fire_emis_mechcomps_n
  use srf_field_check,   only: set_active_Sl_ram1, set_active_Sl_fv, set_active_Sl_soilw, &
                               set_active_Fall_flxdst1, set_active_Fall_flxvoc,           &
                               set_active_Fall_flxfire, set_active_Fall_fco2_lnd,         &
                               set_active_Faoo_fco2_ocn, set_active_Faxa_nhx,             &
                               set_active_Faxa_noy

  implicit none

  SAVE
  public

  integer :: index_a2x_Sa_z            ! bottom atm level height
  integer :: index_a2x_Sa_topo         ! surface topographic height
  integer :: index_a2x_Sa_u            ! bottom atm level zon wind
  integer :: index_a2x_Sa_v            ! bottom atm level mer wind
  integer :: index_a2x_Sa_tbot         ! bottom atm level temp
  integer :: index_a2x_Sa_ptem         ! bottom atm level pot temp
  integer :: index_a2x_Sa_shum         ! bottom atm level spec hum
  integer :: index_a2x_Sa_shum_16O     ! bottom atm level H2O tracer
  integer :: index_a2x_Sa_shum_HDO     ! bottom atm level HDO tracer
  integer :: index_a2x_Sa_shum_18O     ! bottom atm level H218O tracer
  integer :: index_a2x_Sa_shum_17O     ! bottom atm level H217O tracer
  integer :: index_a2x_Sa_shum_HTO     ! bottom atm level HTO tracer
  integer :: index_a2x_Sa_dens         ! bottom atm level air den
  integer :: index_a2x_Sa_pbot         ! bottom atm level pressure
  integer :: index_a2x_Sa_psrf         ! RPF - surface pressure
  integer :: index_a2x_Sa_pslv         ! sea level atm pressure
  integer :: index_a2x_Faxa_lwdn       ! downward lw heat flux
  integer :: index_a2x_Faxa_rainc      ! prec: liquid "convective"
  integer :: index_a2x_Faxa_rainl      ! prec: liquid "large scale"
  integer :: index_a2x_Faxa_snowc      ! prec: frozen "convective"
  integer :: index_a2x_Faxa_snowl      ! prec: frozen "large scale"
  integer :: index_a2x_Faxa_rainc_16O  ! prec: liquid "convective" H2O
  integer :: index_a2x_Faxa_rainl_16O  ! prec: liquid "large scale" H2O
  integer :: index_a2x_Faxa_snowc_16O  ! prec: frozen "convective" H2O
  integer :: index_a2x_Faxa_snowl_16O  ! prec: frozen "large scale" H2O
  integer :: index_a2x_Faxa_rainc_HDO  ! prec: liquid "convective" HDO
  integer :: index_a2x_Faxa_rainl_HDO  ! prec: liquid "large scale" HDO
  integer :: index_a2x_Faxa_snowc_HDO  ! prec: frozen "convective" HDO
  integer :: index_a2x_Faxa_snowl_HDO  ! prec: frozen "large scale" H2O
  integer :: index_a2x_Faxa_rainc_18O  ! prec: liquid "convective" H218O
  integer :: index_a2x_Faxa_rainl_18O  ! prec: liquid "large scale" H218O
  integer :: index_a2x_Faxa_snowc_18O  ! prec: frozen "convective" H218O
  integer :: index_a2x_Faxa_snowl_18O  ! prec: frozen "large scale" H218O
  integer :: index_a2x_Faxa_rainc_17O  ! prec: liquid "convective" H217O
  integer :: index_a2x_Faxa_rainl_17O  ! prec: liquid "large scale" H217O
  integer :: index_a2x_Faxa_snowc_17O  ! prec: frozen "convective" H217O
  integer :: index_a2x_Faxa_snowl_17O  ! prec: frozen "large scale" H217O
  integer :: index_a2x_Faxa_rainc_HTO  ! prec: liquid "convective" HTO
  integer :: index_a2x_Faxa_rainl_HTO  ! prec: liquid "large scale" HTO
  integer :: index_a2x_Faxa_snowc_HTO  ! prec: frozen "convective" HTO
  integer :: index_a2x_Faxa_snowl_HTO  ! prec: frozen "large scale" HTO
  integer :: index_a2x_Faxa_swndr      ! sw: nir direct  downward
  integer :: index_a2x_Faxa_swvdr      ! sw: vis direct  downward
  integer :: index_a2x_Faxa_swndf      ! sw: nir diffuse downward
  integer :: index_a2x_Faxa_swvdf      ! sw: vis diffuse downward
  integer :: index_a2x_Faxa_swnet      ! sw: net
  integer :: index_a2x_Faxa_bcphidry   ! flux: Black Carbon hydrophilic dry deposition
  integer :: index_a2x_Faxa_bcphodry   ! flux: Black Carbon hydrophobic dry deposition
  integer :: index_a2x_Faxa_bcphiwet   ! flux: Black Carbon hydrophilic wet deposition
  integer :: index_a2x_Faxa_ocphidry   ! flux: Organic Carbon hydrophilic dry deposition
  integer :: index_a2x_Faxa_ocphodry   ! flux: Organic Carbon hydrophobic dry deposition
  integer :: index_a2x_Faxa_ocphiwet   ! flux: Organic Carbon hydrophilic dry deposition
  integer :: index_a2x_Faxa_dstwet1    ! flux: Size 1 dust -- wet deposition
  integer :: index_a2x_Faxa_dstwet2    ! flux: Size 2 dust -- wet deposition
  integer :: index_a2x_Faxa_dstwet3    ! flux: Size 3 dust -- wet deposition
  integer :: index_a2x_Faxa_dstwet4    ! flux: Size 4 dust -- wet deposition
  integer :: index_a2x_Faxa_dstdry1    ! flux: Size 1 dust -- dry deposition
  integer :: index_a2x_Faxa_dstdry2    ! flux: Size 2 dust -- dry deposition
  integer :: index_a2x_Faxa_dstdry3    ! flux: Size 3 dust -- dry deposition
  integer :: index_a2x_Faxa_dstdry4    ! flux: Size 4 dust -- dry deposition
  integer :: index_a2x_Sa_co2prog      ! bottom atm level prognostic co2
  integer :: index_a2x_Sa_co2diag      ! bottom atm level diagnostic co2
  integer :: index_a2x_Faxa_nhx        ! flux: Nitrogen deposition
  integer :: index_a2x_Faxa_noy        ! flux: Nitrogen deposition

  integer :: index_x2a_Sx_t            ! surface temperature             
  integer :: index_x2a_So_t            ! sea surface temperature         
  integer :: index_x2a_Sf_lfrac        ! surface land fraction           
  integer :: index_x2a_Sf_ifrac        ! surface ice fraction            
  integer :: index_x2a_Sf_ofrac        ! surface ocn fraction            
  integer :: index_x2a_Sx_tref         ! 2m reference temperature        
  integer :: index_x2a_Sx_qref         ! 2m reference specific humidity  
  integer :: index_x2a_Sx_avsdr        ! albedo, visible, direct         
  integer :: index_x2a_Sx_anidr        ! albedo, near-ir, direct         
  integer :: index_x2a_Sx_avsdf        ! albedo, visible, diffuse        
  integer :: index_x2a_Sx_anidf        ! albedo, near-ir, diffuse        
  integer :: index_x2a_Sl_snowh        ! surface snow depth over land
  integer :: index_x2a_Si_snowh        ! surface snow depth over ice
  integer :: index_x2a_Sl_fv           ! friction velocity
  integer :: index_x2a_Sl_z0m          ! roughness length - RPF (m) 
  integer :: index_x2a_Sl_ram1         ! aerodynamical resistance
  integer :: index_x2a_Sl_soilw        ! volumetric soil water
  integer :: index_x2a_Faxx_taux       ! wind stress, zonal              
  integer :: index_x2a_Faxx_tauy       ! wind stress, meridional         
  integer :: index_x2a_Faxx_lat        ! latent          heat flux       
  integer :: index_x2a_Faxx_sen        ! sensible        heat flux       
  integer :: index_x2a_Faxx_lwup       ! upward longwave heat flux       
  integer :: index_x2a_Faxx_evap       ! evaporation    water flux       
  !RPF - 200909 - add land evap and constituent fluxes
  integer :: index_x2a_Faxx_evpnl      ! evaporation    water flux w/out lake fluxes    
  integer :: index_x2a_Faxx_levap      ! lake evap      water flux
  integer :: index_x2a_Faxx_ievap      ! ice evap       water flux
  integer :: index_x2a_Faxx_trans      ! transpiration  water flux       
  integer :: index_x2a_Faxx_sevap      ! soil evap      water flux       
  integer :: index_x2a_Faxx_inter       ! interception   water flux       
  !/RPF
  integer :: index_x2a_Faxx_evap_16O   ! evaporation    H216O flux
  integer :: index_x2a_Faxx_evap_HDO   ! evaporation    HD16O flux
  integer :: index_x2a_Faxx_evap_18O   ! evaporation    H218O flux
  integer :: index_x2a_Faxx_evap_17O   ! evaporation    H217O flux
  integer :: index_x2a_Faxx_evap_HTO   ! evaporation    HT16O flux
  integer :: index_x2a_Fall_flxdst1    ! dust flux size bin 1    
  integer :: index_x2a_Fall_flxdst2    ! dust flux size bin 2    
  integer :: index_x2a_Fall_flxdst3    ! dust flux size bin 3    
  integer :: index_x2a_Fall_flxdst4    ! dust flux size bin 4
  integer :: index_x2a_Fall_flxvoc     ! MEGAN emissions fluxes   
  integer :: index_x2a_Fall_flxfire    ! Fire emissions fluxes   
  integer :: index_x2a_Sl_ztopfire   ! Fire emissions fluxes top of vert distribution  
  integer :: index_x2a_Fall_fco2_lnd   ! co2 flux from land   
  integer :: index_x2a_Faoo_fco2_ocn   ! co2 flux from ocean  
  integer :: index_x2a_Faoo_fdms_ocn   ! dms flux from ocean
  integer :: index_x2a_So_ustar        ! surface friction velocity in ocean
  integer :: index_x2a_So_re           ! square of atm/ocn exch. coeff 
  integer :: index_x2a_So_ssq          ! surface saturation specific humidity in ocean 
  integer :: index_x2a_Sl_ddvel        ! dry deposition velocities from land
  integer :: index_x2a_Sx_u10          ! 10m wind

contains

  subroutine cam_cpl_indices_set( )

    type(mct_aVect) :: a2x      ! temporary
    type(mct_aVect) :: x2a      ! temporary

    ! Determine attribute vector indices

    ! create temporary attribute vectors
    call mct_aVect_init(x2a, rList=seq_flds_x2a_fields, lsize=1)
    call mct_aVect_init(a2x, rList=seq_flds_a2x_fields, lsize=1)

    ! Initialize av indices
    index_x2a_Sx_avsdr      = mct_avect_indexra(x2a,'Sx_avsdr')
    index_x2a_Sx_anidr      = mct_avect_indexra(x2a,'Sx_anidr')
    index_x2a_Sx_avsdf      = mct_avect_indexra(x2a,'Sx_avsdf')
    index_x2a_Sx_anidf      = mct_avect_indexra(x2a,'Sx_anidf')
    index_x2a_Sx_t          = mct_avect_indexra(x2a,'Sx_t')
    index_x2a_So_t          = mct_avect_indexra(x2a,'So_t')
    index_x2a_Sl_snowh      = mct_avect_indexra(x2a,'Sl_snowh')
    index_x2a_Si_snowh      = mct_avect_indexra(x2a,'Si_snowh')
    
    index_x2a_Sl_fv         = mct_avect_indexra(x2a,'Sl_fv')
    !not sure why these are here twice?? -RPF, 201124
    index_x2a_Sl_z0m        = mct_avect_indexra(x2a,'Sl_z0m') !RPF - pass clm roughness length
    index_x2a_Sl_ram1       = mct_avect_indexra(x2a,'Sl_ram1')
    index_x2a_Sl_soilw      = mct_avect_indexra(x2a,'Sl_soilw',perrWith='quiet')
    
    index_x2a_Sx_tref       = mct_avect_indexra(x2a,'Sx_tref')
    index_x2a_Sx_qref       = mct_avect_indexra(x2a,'Sx_qref')

    index_x2a_Sf_ifrac      = mct_avect_indexra(x2a,'Sf_ifrac')
    index_x2a_Sf_ofrac      = mct_avect_indexra(x2a,'Sf_ofrac')
    index_x2a_Sf_lfrac      = mct_avect_indexra(x2a,'Sf_lfrac')

    index_x2a_Sx_u10        = mct_avect_indexra(x2a,'Sx_u10')
    index_x2a_Faxx_taux     = mct_avect_indexra(x2a,'Faxx_taux')
    index_x2a_Faxx_tauy     = mct_avect_indexra(x2a,'Faxx_tauy')
    index_x2a_Faxx_lat      = mct_avect_indexra(x2a,'Faxx_lat')
    index_x2a_Faxx_sen      = mct_avect_indexra(x2a,'Faxx_sen')
    index_x2a_Faxx_lwup     = mct_avect_indexra(x2a,'Faxx_lwup')
    index_x2a_Faxx_evap     = mct_avect_indexra(x2a,'Faxx_evap')
    !RPF - 200909 - add constituent fluxes and levap/ievap flux.
    index_x2a_Faxx_evpnl    = mct_avect_indexra(x2a,'Faxx_evpnl')
    index_x2a_Faxx_levap    = mct_avect_indexra(x2a,'Faxx_levap')
    index_x2a_Faxx_ievap    = mct_avect_indexra(x2a,'Faxx_ievap')
    index_x2a_Faxx_trans    = mct_avect_indexra(x2a,'Faxx_trans')
    index_x2a_Faxx_sevap    = mct_avect_indexra(x2a,'Faxx_sevap')
    index_x2a_Faxx_inter    = mct_avect_indexra(x2a,'Faxx_inter')
    !/RPF
    index_x2a_Faxx_evap_16O = mct_avect_indexra(x2a,'Faxx_evap_16O', perrWith='quiet')
    index_x2a_Faxx_evap_HDO = mct_avect_indexra(x2a,'Faxx_evap_HDO', perrWith='quiet')
    index_x2a_Faxx_evap_18O = mct_avect_indexra(x2a,'Faxx_evap_18O', perrWith='quiet')
    index_x2a_Faxx_evap_17O = mct_avect_indexra(x2a,'Faxx_evap_17O', perrWith='quiet')
    index_x2a_Faxx_evap_HTO = mct_avect_indexra(x2a,'Faxx_evap_HTO', perrWith='quiet')
    index_x2a_So_ustar      = mct_avect_indexra(x2a,'So_ustar')
    index_x2a_So_re         = mct_avect_indexra(x2a,'So_re')
    index_x2a_So_ssq        = mct_avect_indexra(x2a,'So_ssq')
    index_x2a_Sl_fv         = mct_avect_indexra(x2a,'Sl_fv')
!    index_x2a_Sl_z0m        = mct_avect_indexra(x2a,'Sl_z0m') !RPF - pass clm roughness length
    index_x2a_Sl_ram1       = mct_avect_indexra(x2a,'Sl_ram1')
    index_x2a_Fall_flxdst1  = mct_avect_indexra(x2a,'Fall_flxdst1')
    index_x2a_Fall_flxdst2  = mct_avect_indexra(x2a,'Fall_flxdst2')
    index_x2a_Fall_flxdst3  = mct_avect_indexra(x2a,'Fall_flxdst3')
    index_x2a_Fall_flxdst4  = mct_avect_indexra(x2a,'Fall_flxdst4')
    index_x2a_Fall_fco2_lnd = mct_avect_indexra(x2a,'Fall_fco2_lnd',perrWith='quiet')
    index_x2a_Faoo_fco2_ocn = mct_avect_indexra(x2a,'Faoo_fco2_ocn',perrWith='quiet')
    index_x2a_Faoo_fdms_ocn = mct_avect_indexra(x2a,'Faoo_fdms_ocn',perrWith='quiet')

    if (shr_megan_mechcomps_n>0) then
       index_x2a_Fall_flxvoc = mct_avect_indexra(x2a,trim(shr_megan_fields_token))
    else
       index_x2a_Fall_flxvoc = 0
    endif

    if (shr_fire_emis_mechcomps_n>0) then
       index_x2a_Fall_flxfire = mct_avect_indexra(x2a,trim(shr_fire_emis_fields_token))
       index_x2a_Sl_ztopfire = mct_avect_indexra(x2a,trim(shr_fire_emis_ztop_token))
    else
       index_x2a_Fall_flxfire = 0
       index_x2a_Sl_ztopfire = 0
    endif

    if ( lnd_drydep )then
       index_x2a_Sl_ddvel   = mct_avect_indexra(x2a, trim(drydep_fields_token))
    else
       index_x2a_Sl_ddvel   = 0
    end if

    index_a2x_Sa_z          = mct_avect_indexra(a2x,'Sa_z')
    index_a2x_Sa_topo       = mct_avect_indexra(a2x,'Sa_topo')
    index_a2x_Sa_u          = mct_avect_indexra(a2x,'Sa_u')
    index_a2x_Sa_v          = mct_avect_indexra(a2x,'Sa_v')
    index_a2x_Sa_tbot       = mct_avect_indexra(a2x,'Sa_tbot')
    index_a2x_Sa_ptem       = mct_avect_indexra(a2x,'Sa_ptem')
    index_a2x_Sa_pbot       = mct_avect_indexra(a2x,'Sa_pbot')
    index_a2x_Sa_psrf       = mct_avect_indexra(a2x,'Sa_psrf') !RPF
    index_a2x_Sa_pslv       = mct_avect_indexra(a2x,'Sa_pslv')
    index_a2x_Sa_shum       = mct_avect_indexra(a2x,'Sa_shum')
    index_a2x_Sa_shum_16O   = mct_avect_indexra(a2x,'Sa_shum_16O', perrWith='quiet')
    index_a2x_Sa_shum_HDO   = mct_avect_indexra(a2x,'Sa_shum_HDO', perrWith='quiet')
    index_a2x_Sa_shum_18O   = mct_avect_indexra(a2x,'Sa_shum_18O', perrWith='quiet')
    index_a2x_Sa_shum_17O   = mct_avect_indexra(a2x,'Sa_shum_17O', perrWith='quiet')
    index_a2x_Sa_shum_HTO   = mct_avect_indexra(a2x,'Sa_shum_HTO', perrWith='quiet')
    index_a2x_Sa_dens       = mct_avect_indexra(a2x,'Sa_dens')
    index_a2x_Faxa_swnet    = mct_avect_indexra(a2x,'Faxa_swnet')
    index_a2x_Faxa_lwdn     = mct_avect_indexra(a2x,'Faxa_lwdn')
    index_a2x_Faxa_rainc    = mct_avect_indexra(a2x,'Faxa_rainc')
    index_a2x_Faxa_rainl    = mct_avect_indexra(a2x,'Faxa_rainl')
    index_a2x_Faxa_snowc    = mct_avect_indexra(a2x,'Faxa_snowc')
    index_a2x_Faxa_snowl    = mct_avect_indexra(a2x,'Faxa_snowl')
    index_a2x_Faxa_rainc_16O= mct_avect_indexra(a2x,'Faxa_rainc_16O', perrWith='quiet')
    index_a2x_Faxa_rainl_16O= mct_avect_indexra(a2x,'Faxa_rainl_16O', perrWith='quiet')
    index_a2x_Faxa_snowc_16O= mct_avect_indexra(a2x,'Faxa_snowc_16O', perrWith='quiet')
    index_a2x_Faxa_snowl_16O= mct_avect_indexra(a2x,'Faxa_snowl_16O', perrWith='quiet')
    index_a2x_Faxa_rainc_HDO= mct_avect_indexra(a2x,'Faxa_rainc_HDO', perrWith='quiet')
    index_a2x_Faxa_rainl_HDO= mct_avect_indexra(a2x,'Faxa_rainl_HDO', perrWith='quiet')
    index_a2x_Faxa_snowc_HDO= mct_avect_indexra(a2x,'Faxa_snowc_HDO', perrWith='quiet')
    index_a2x_Faxa_snowl_HDO= mct_avect_indexra(a2x,'Faxa_snowl_HDO', perrWith='quiet')
    index_a2x_Faxa_rainc_18O= mct_avect_indexra(a2x,'Faxa_rainc_18O', perrWith='quiet')
    index_a2x_Faxa_rainl_18O= mct_avect_indexra(a2x,'Faxa_rainl_18O', perrWith='quiet')
    index_a2x_Faxa_snowc_18O= mct_avect_indexra(a2x,'Faxa_snowc_18O', perrWith='quiet')
    index_a2x_Faxa_snowl_18O= mct_avect_indexra(a2x,'Faxa_snowl_18O', perrWith='quiet')
    index_a2x_Faxa_rainc_18O= mct_avect_indexra(a2x,'Faxa_rainc_17O', perrWith='quiet')
    index_a2x_Faxa_rainl_18O= mct_avect_indexra(a2x,'Faxa_rainl_17O', perrWith='quiet')
    index_a2x_Faxa_snowc_18O= mct_avect_indexra(a2x,'Faxa_snowc_17O', perrWith='quiet')
    index_a2x_Faxa_snowl_18O= mct_avect_indexra(a2x,'Faxa_snowl_17O', perrWith='quiet')
    index_a2x_Faxa_rainc_18O= mct_avect_indexra(a2x,'Faxa_rainc_HTO', perrWith='quiet')
    index_a2x_Faxa_rainl_18O= mct_avect_indexra(a2x,'Faxa_rainl_HTO', perrWith='quiet')
    index_a2x_Faxa_snowc_18O= mct_avect_indexra(a2x,'Faxa_snowc_HTO', perrWith='quiet')
    index_a2x_Faxa_snowl_18O= mct_avect_indexra(a2x,'Faxa_snowl_HTO', perrWith='quiet')
    index_a2x_Faxa_swndr    = mct_avect_indexra(a2x,'Faxa_swndr')
    index_a2x_Faxa_swvdr    = mct_avect_indexra(a2x,'Faxa_swvdr')
    index_a2x_Faxa_swndf    = mct_avect_indexra(a2x,'Faxa_swndf')
    index_a2x_Faxa_swvdf    = mct_avect_indexra(a2x,'Faxa_swvdf')
    index_a2x_Faxa_bcphidry = mct_avect_indexra(a2x,'Faxa_bcphidry')
    index_a2x_Faxa_bcphodry = mct_avect_indexra(a2x,'Faxa_bcphodry')
    index_a2x_Faxa_bcphiwet = mct_avect_indexra(a2x,'Faxa_bcphiwet')
    index_a2x_Faxa_ocphidry = mct_avect_indexra(a2x,'Faxa_ocphidry')
    index_a2x_Faxa_ocphodry = mct_avect_indexra(a2x,'Faxa_ocphodry')
    index_a2x_Faxa_ocphiwet = mct_avect_indexra(a2x,'Faxa_ocphiwet')
    index_a2x_Faxa_dstdry1  = mct_avect_indexra(a2x,'Faxa_dstdry1')
    index_a2x_Faxa_dstdry2  = mct_avect_indexra(a2x,'Faxa_dstdry2')
    index_a2x_Faxa_dstdry3  = mct_avect_indexra(a2x,'Faxa_dstdry3')
    index_a2x_Faxa_dstdry4  = mct_avect_indexra(a2x,'Faxa_dstdry4')
    index_a2x_Faxa_dstwet1  = mct_avect_indexra(a2x,'Faxa_dstwet1')
    index_a2x_Faxa_dstwet2  = mct_avect_indexra(a2x,'Faxa_dstwet2')
    index_a2x_Faxa_dstwet3  = mct_avect_indexra(a2x,'Faxa_dstwet3')
    index_a2x_Faxa_dstwet4  = mct_avect_indexra(a2x,'Faxa_dstwet4')
    index_a2x_Sa_co2prog    = mct_avect_indexra(a2x,'Sa_co2prog',perrWith='quiet')
    index_a2x_Sa_co2diag    = mct_avect_indexra(a2x,'Sa_co2diag',perrWith='quiet')
    index_a2x_Faxa_nhx      = mct_avect_indexra(a2x,'Faxa_nhx',perrWith='quiet')
    index_a2x_Faxa_noy      = mct_avect_indexra(a2x,'Faxa_noy',perrWith='quiet')

    ! Call coupler independent interface routines to set flags for specific
    ! fields so CAM can query whether they are passed by the coupler.
    call set_active_Sl_ram1(      index_x2a_Sl_ram1>0)
    call set_active_Sl_fv(        index_x2a_Sl_fv>0)
    call set_active_Sl_soilw(     index_x2a_Sl_soilw>0)
    call set_active_Fall_flxdst1( index_x2a_Fall_flxdst1>0)
    call set_active_Fall_flxvoc(  index_x2a_Fall_flxvoc>0)
    call set_active_Fall_flxfire( index_x2a_Fall_flxfire>0)
    call set_active_Fall_fco2_lnd(index_x2a_Fall_fco2_lnd>0)
    call set_active_Faoo_fco2_ocn(index_x2a_Faoo_fco2_ocn>0)

    ! Call coupler independent interface routines to set flags for specific
    ! fields so CAM can query whether the coupler expects them to be provided.
    call set_active_Faxa_nhx(     index_a2x_Faxa_nhx>0)
    call set_active_Faxa_noy(     index_a2x_Faxa_noy>0)

    call mct_aVect_clean(x2a)
    call mct_aVect_clean(a2x)

  end subroutine cam_cpl_indices_set

end module cam_cpl_indices
