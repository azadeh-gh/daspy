!$Id: initialize.F90 1399 2013-05-06 09:21:15Z lnerger $
!BOP
!
! !ROUTINE: initialize  --- initialize the 2D offline example for PDAF
!
! !INTERFACE:
SUBROUTINE initialize()

! !DESCRIPTION:
! Routine to perform initialization of the 2D offline example for
! PDAF. Here, only the global size of the model domain and the
! global size of the model state vector need to be initialized.
! Generally, this could also be joined with the routine init_pdaf().
!
! For the 2D offline tutorial example, the domain is defined by the
! dimensions nx and ny. The state vector size is nx*ny.
!
! !REVISION HISTORY:
! 2013-02 - Lars Nerger - Initial code
! Later revisions - see svn log
!
! !USES:
  USE mod_assimilation, & ! Model variables
       ONLY: dim_state_p, nx, ny, &
       STATE_DIM, OBS_DIM, ENSEMBLE_NUMBER, ncid, varid, &
       XF_NC, HXF_NC, OBS_NC, XF_COORD_NC, OBS_COORD_NC, R_NC, H_NC, &
       FILE_NAME, STATE_DIM_NAME, OBS_DIM_NAME, ENSEMBLE_NUMBER_NAME, &
       XF_NAME, HXF_NAME, H_NAME, OBS_NAME, XF_COORD_NAME, OBS_COORD_NAME, R_NAME, XA_NAME, XM_NAME

  USE mod_parallel, &     ! Parallelization variables
       ONLY: MPI_COMM_WORLD, MPIerr, npes_world, mype_world, &
       n_modeltasks, mype_model, npes_model, task_id, &
       init_parallel, finalize_parallel

  IMPLICIT NONE

!EOP

! *** Model specifications ***
  nx = STATE_DIM    ! Extent of grid in x-direction
  ny = 1    ! Extent of grid in y-direction

  dim_state_p   = nx * ny ! State dimension (shared via MOD_OFFLINE)

! *** Screen output ***
  WRITE (*, '(1x, a)') 'INITIALIZE MODEL INFORMATION FOR PDAF OFFLINE MODE'
  WRITE (*, '(22x,a)') 'MODEL: 2D Offline Example for Tutorial'
  WRITE (*, '(24x,a,i4,1x,a1,1x,i4)') 'Grid size:',nx,'x',ny
  WRITE (*, '(5x, a, i7)') &
       'Global model state dimension:', dim_state_p

END SUBROUTINE initialize
