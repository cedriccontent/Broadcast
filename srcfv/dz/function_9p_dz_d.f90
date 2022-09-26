! This Source Code Form is subject to the terms of the Mozilla Public License, v. 2.0. If a copy of the MPL was not distributed with this file, You can obtain one at https://mozilla.org/MPL/2.0/.
!        Generated by TAPENADE     (INRIA, Ecuador team)
!  Tapenade 3.16 (master) -  9 Oct 2020 17:47
!
!  Differentiation of function_9p_dz in forward (tangent) mode (with options with!SliceDeadControl with!SliceDeadInstrs with!Stat
!icTaping):
!   variations   of useful results: func0 func1 func2 func3 func4
!                func5 func6 func7 func8 func9 func10 func11 func12
!                func13 func14 func15
!   with respect to varying inputs: w
!   RW status of diff variables: func0:out func1:out func2:out
!                w:in func3:out func4:out func5:out func6:out func7:out
!                func8:out func9:out func10:out func11:out func12:out
!                func13:out func14:out func15:out
! =============================================================================
! consistent fluxes for DNC7 2D
! =============================================================================
!
SUBROUTINE FUNCTION_9P_DZ_D(func0, func0d, func1, func1d, func2, func2d&
& , func3, func3d, func4, func4d, func5, func5d, func6, func6d, func7, &
& func7d, func8, func8d, func9, func9d, func10, func10d, func11, func11d&
& , func12, func12d, func13, func13d, func14, func14d, func15, func15d, &
& w, wd, x0, y0, nx, ny, xc, yc, vol, volf, gh, cp, cv, prandtl, gam, &
& rgaz, cs, muref, tref, s_suth, im, jm)
  IMPLICIT NONE
!
! variables for dimension -----------------------------------------
  INTEGER :: im, jm, gh
! required arguments ----------------------------------------------
! thermo
  REAL*8, INTENT(IN) :: cp, cv, prandtl, gam, rgaz
! viscosity
  REAL*8, INTENT(IN) :: cs, muref, tref, s_suth
  REAL*8, DIMENSION(1-gh:im+gh+1, 1-gh:jm+gh+1), INTENT(IN) :: x0
  REAL*8, DIMENSION(1-gh:im+gh+1, 1-gh:jm+gh+1), INTENT(IN) :: y0
  REAL*8, DIMENSION(1-gh:im+gh+1, 1-gh:jm+gh+1, 2), INTENT(IN) :: nx
  REAL*8, DIMENSION(1-gh:im+gh+1, 1-gh:jm+gh+1, 2), INTENT(IN) :: ny
  REAL*8, DIMENSION(1-gh:im+gh, 1-gh:jm+gh), INTENT(IN) :: xc
  REAL*8, DIMENSION(1-gh:im+gh, 1-gh:jm+gh), INTENT(IN) :: yc
  REAL*8, DIMENSION(1-gh:im+gh, 1-gh:jm+gh), INTENT(IN) :: vol
  REAL*8, DIMENSION(1-gh:im+gh, 1-gh:jm+gh, 2), INTENT(IN) :: volf
  REAL*8, DIMENSION(1-gh:im+gh, 1-gh:jm+gh, 5), INTENT(IN) :: w
  REAL*8, DIMENSION(1-gh:im+gh, 1-gh:jm+gh, 5), INTENT(IN) :: wd
! Returned objects ------------------------------------------------
  REAL*8, DIMENSION(1-gh:im+gh, 1-gh:jm+gh, 5), INTENT(INOUT) :: func0
  REAL*8, DIMENSION(1-gh:im+gh, 1-gh:jm+gh, 5), INTENT(INOUT) :: func0d
  REAL*8, DIMENSION(1-gh:im+gh, 1-gh:jm+gh, 5), INTENT(INOUT) :: func1
  REAL*8, DIMENSION(1-gh:im+gh, 1-gh:jm+gh, 5), INTENT(INOUT) :: func1d
  REAL*8, DIMENSION(1-gh:im+gh, 1-gh:jm+gh, 5), INTENT(INOUT) :: func2
  REAL*8, DIMENSION(1-gh:im+gh, 1-gh:jm+gh, 5), INTENT(INOUT) :: func2d
  REAL*8, DIMENSION(1-gh:im+gh, 1-gh:jm+gh, 5), INTENT(INOUT) :: func3
  REAL*8, DIMENSION(1-gh:im+gh, 1-gh:jm+gh, 5), INTENT(INOUT) :: func3d
  REAL*8, DIMENSION(1-gh:im+gh, 1-gh:jm+gh, 5), INTENT(INOUT) :: func4
  REAL*8, DIMENSION(1-gh:im+gh, 1-gh:jm+gh, 5), INTENT(INOUT) :: func4d
  REAL*8, DIMENSION(1-gh:im+gh, 1-gh:jm+gh, 5), INTENT(INOUT) :: func5
  REAL*8, DIMENSION(1-gh:im+gh, 1-gh:jm+gh, 5), INTENT(INOUT) :: func5d
  REAL*8, DIMENSION(1-gh:im+gh, 1-gh:jm+gh, 5), INTENT(INOUT) :: func6
  REAL*8, DIMENSION(1-gh:im+gh, 1-gh:jm+gh, 5), INTENT(INOUT) :: func6d
  REAL*8, DIMENSION(1-gh:im+gh, 1-gh:jm+gh, 5), INTENT(INOUT) :: func7
  REAL*8, DIMENSION(1-gh:im+gh, 1-gh:jm+gh, 5), INTENT(INOUT) :: func7d
  REAL*8, DIMENSION(1-gh:im+gh, 1-gh:jm+gh, 5), INTENT(INOUT) :: func8
  REAL*8, DIMENSION(1-gh:im+gh, 1-gh:jm+gh, 5), INTENT(INOUT) :: func8d
  REAL*8, DIMENSION(1-gh:im+gh, 1-gh:jm+gh, 5), INTENT(INOUT) :: func9
  REAL*8, DIMENSION(1-gh:im+gh, 1-gh:jm+gh, 5), INTENT(INOUT) :: func9d
  REAL*8, DIMENSION(1-gh:im+gh, 1-gh:jm+gh, 5), INTENT(INOUT) :: func10
  REAL*8, DIMENSION(1-gh:im+gh, 1-gh:jm+gh, 5), INTENT(INOUT) :: func10d
  REAL*8, DIMENSION(1-gh:im+gh, 1-gh:jm+gh, 5), INTENT(INOUT) :: func11
  REAL*8, DIMENSION(1-gh:im+gh, 1-gh:jm+gh, 5), INTENT(INOUT) :: func11d
  REAL*8, DIMENSION(1-gh:im+gh, 1-gh:jm+gh, 5), INTENT(INOUT) :: func12
  REAL*8, DIMENSION(1-gh:im+gh, 1-gh:jm+gh, 5), INTENT(INOUT) :: func12d
  REAL*8, DIMENSION(1-gh:im+gh, 1-gh:jm+gh, 5), INTENT(INOUT) :: func13
  REAL*8, DIMENSION(1-gh:im+gh, 1-gh:jm+gh, 5), INTENT(INOUT) :: func13d
  REAL*8, DIMENSION(1-gh:im+gh, 1-gh:jm+gh, 5), INTENT(INOUT) :: func14
  REAL*8, DIMENSION(1-gh:im+gh, 1-gh:jm+gh, 5), INTENT(INOUT) :: func14d
  REAL*8, DIMENSION(1-gh:im+gh, 1-gh:jm+gh, 5), INTENT(INOUT) :: func15
  REAL*8, DIMENSION(1-gh:im+gh, 1-gh:jm+gh, 5), INTENT(INOUT) :: func15d
! Non-required arguments -------------------------------------------
  REAL*8, DIMENSION(1-gh:im+gh+1, 1-gh:jm+gh+1, 5, 2) :: hn
  REAL*8, DIMENSION(1-gh:im+gh, 1-gh:jm+gh, 5) :: f, g
  REAL*8, DIMENSION(1-gh:im+gh, 1-gh:jm+gh) :: velx
  REAL*8, DIMENSION(1-gh:im+gh, 1-gh:jm+gh) :: velxd
  REAL*8, DIMENSION(1-gh:im+gh, 1-gh:jm+gh) :: vely
  REAL*8, DIMENSION(1-gh:im+gh, 1-gh:jm+gh) :: velyd
  REAL*8, DIMENSION(1-gh:im+gh, 1-gh:jm+gh) :: velz
  REAL*8, DIMENSION(1-gh:im+gh, 1-gh:jm+gh) :: velzd
  REAL*8, DIMENSION(1-gh:im+gh, 1-gh:jm+gh) :: tloc
  REAL*8, DIMENSION(1-gh:im+gh, 1-gh:jm+gh) :: tlocd
  REAL*8, DIMENSION(1-gh:im+gh, 1-gh:jm+gh) :: p
  REAL*8, DIMENSION(1-gh:im+gh, 1-gh:jm+gh) :: pd
  REAL*8, DIMENSION(1-gh:im+gh, 1-gh:jm+gh) :: mu
  REAL*8, DIMENSION(1-gh:im+gh, 1-gh:jm+gh) :: mud
  REAL*8, DIMENSION(1-gh:im+gh, 1-gh:jm+gh, 2) :: gradu, gradv, gradw, &
& gradmu
  REAL*8, DIMENSION(1-gh:im+gh, 1-gh:jm+gh, 2) :: gradud, gradvd, gradwd
  REAL*8, DIMENSION(5) :: deltar, deltal, t
  INTEGER :: i, j, h
  REAL*8 :: nx_n, nx_s, nx_e, nx_o, volm1, ux, vx, wx, tx
  REAL*8 :: ny_n, ny_s, ny_e, ny_o, uy, vy, wy, ty
  REAL*8 :: val_n, val_s, val_e, val_o
  REAL*8 :: fxro1, fxro2, fxrou1, fxrou2, fxrov1, fxrov2, fxrow1, fxrow2&
& , fxroe1, fxroe2
  REAL*8 :: fvro1, fvro2, fvrou1, fvrou2, fvrov1, fvrov2, fvrow1, fvrow2&
& , fvroe1, fvroe2
  REAL*8 :: gvro1, gvro2, gvrou1, gvrou2, gvrov1, gvrov2, gvrow1, gvrow2&
& , gvroe1, gvroe2
  REAL*8 :: dissro1, dissro2, dissrou1, dissrou2, dissrov1, dissrov2, &
& dissrow1, dissrow2, dissroe1, dissroe2
  REAL*8 :: cpprandtl, mmu, lambda, uu, vv, ww, ro, rom1, htot, eloc, ec
  REAL*8 :: rod, rom1d, elocd, ecd
  REAL*8 :: predro1, predrou1, predrov1, predrow1, predroe1, eps2, eps4
  REAL*8 :: predro2, predrou2, predrov2, predrow2, predroe2, rspec
  REAL*8 :: divu2, vort2, dxm1, dym1, dxm2, dym2
  REAL*8 :: gui, gvi, gwi, gmui
  REAL*8 :: guid, gvid, gwid
  REAL*8 :: guj, gvj, gwj, gmuj
  REAL*8 :: gujd, gvjd, gwjd
  REAL*8 :: nxloc, nyloc, sn, invsn, sc1, sc2
  REAL*8 :: rhom, rhomr, rhoml, rhom1l, c2l, c2r, rr, r, u, ur, ul, vr, &
& vl, wr, wl, c2x, nx2, ny2
  REAL*8 :: ab, sq, ducros1, ducros2, k_sensor1, k_sensor2
  REAL*8 :: b1, b2, b3, b4, b5, c1, c2, c3, c4, c5, d1, d2, d3, d4, d5, &
& wiggle, denom, betas
! for bnd off-centered schemes
  REAL*8 :: a0, a1, a2, a3, a4, a5, a6, a7, a8, a9, a10
  REAL*8 :: c9d0, c9d1, c9d2, c9d3, c9d4, c9d5, c9d6, c9d7, c9d8, c9d9, &
& c9d10
  REAL*8 :: c7d0, c7d1, c7d2, c7d3, c7d4, c7d5, c7d6, c7d7, c7d8, c7d9, &
& c7d10
  REAL*8 :: c5d0, c5d1, c5d2, c5d3, c5d4, c5d5, c5d6, c5d7, c5d8, c5d9, &
& c5d10
  REAL*8 :: c3d0, c3d1, c3d2, c3d3, c3d4, c3d5, c3d6, c3d7, c3d8, c3d9, &
& c3d10
  REAL*8 :: pw, ct0, ct1, ct2, coef, omrr, test, diffro, diffrou, &
& diffrov, diffrow, diffroe, v
  REAL*8 :: half, one, zero, two, twothird, fourth, twelfth, cvm1
  REAL*8 :: twentyfourth, ccross
  INTRINSIC SQRT
  REAL*8 :: result1
  REAL*8 :: result1d
  REAL*8 :: temp
! -----------------------------------------------------------------
!
  half = 0.5d0
  one = 1.d0
  two = 2.d0
  twothird = two/3.d0
  cvm1 = one/cv
  denom = 1.d0/840.d0
! Coef for grad o8
! 4.d0/5.d0
  b1 = 672.d0*denom
!-1.d0/5.d0
  b2 = -(168.d0*denom)
! 4.d0/105.d0
  b3 = 32.d0*denom
!-1.d0/280.d0
  b4 = -(3.d0*denom)
  result1 = SQRT(tref)
  betas = muref*(tref+cs)/(result1*tref)
  pd = 0.0_8
  velxd = 0.0_8
  velyd = 0.0_8
  velzd = 0.0_8
  tlocd = 0.0_8
  mud = 0.0_8
! Primitives
  DO j=1-gh,jm+gh
!DIR$ IVDEP
    DO i=1-gh,im+gh
      rod = wd(i, j, 1)
      ro = w(i, j, 1)
      rom1d = -(one*rod/ro**2)
      rom1 = one/ro
      velxd(i, j) = rom1*wd(i, j, 2) + w(i, j, 2)*rom1d
      velx(i, j) = w(i, j, 2)*rom1
      velyd(i, j) = rom1*wd(i, j, 3) + w(i, j, 3)*rom1d
      vely(i, j) = w(i, j, 3)*rom1
      velzd(i, j) = rom1*wd(i, j, 4) + w(i, j, 4)*rom1d
      velz(i, j) = w(i, j, 4)*rom1
!
      ecd = half*(2*velx(i, j)*velxd(i, j)+2*vely(i, j)*velyd(i, j)+2*&
&       velz(i, j)*velzd(i, j))
      ec = half*(velx(i, j)*velx(i, j)+vely(i, j)*vely(i, j)+velz(i, j)*&
&       velz(i, j))
! ec = HALF*( velx(i,j)*velx(i,j) &
! + vely(i,j)*vely(i,j))
!
      temp = w(i, j, 5) - ec*ro
      elocd = rom1*(wd(i, j, 5)-ro*ecd-ec*rod) + temp*rom1d
      eloc = temp*rom1
!
      tlocd(i, j) = cvm1*elocd
      tloc(i, j) = eloc*cvm1
!
      pd(i, j) = (gam-one)*(eloc*rod+ro*elocd)
      p(i, j) = (gam-one)*ro*eloc
! p(i,j) = ro*rgaz*tloc(i,j)
!h(i,j,1) = w(i,j,4)
!h(i,j,2) = w(i,j,4) * velx(i,j)
!h(i,j,3) = w(i,j,4) * vely(i,j)
!h(i,j,4) = w(i,j,4) * velz(i,j) + p(i,j)
!h(i,j,5) = w(i,j,4) * htot
      temp = SQRT(tloc(i, j))
      IF (tloc(i, j) .EQ. 0.0) THEN
        result1d = 0.0_8
      ELSE
        result1d = tlocd(i, j)/(2.0*temp)
      END IF
      result1 = temp
      temp = result1*tloc(i, j)/(s_suth+tloc(i, j))
      mud(i, j) = betas*(tloc(i, j)*result1d+(result1-temp)*tlocd(i, j))&
&       /(s_suth+tloc(i, j))
      mu(i, j) = betas*temp
    END DO
  END DO
  gradud = 0.0_8
  gradvd = 0.0_8
  gradwd = 0.0_8
! Work on interior domain minus one cell
  DO j=1,jm
!DIR$ IVDEP
    DO i=1,im
!idir
      guid = b1*(velxd(i+1, j)-velxd(i-1, j)) + b2*(velxd(i+2, j)-velxd(&
&       i-2, j)) + b3*(velxd(i+3, j)-velxd(i-3, j)) + b4*(velxd(i+4, j)-&
&       velxd(i-4, j))
      gui = b1*(velx(i+1, j)-velx(i-1, j)) + b2*(velx(i+2, j)-velx(i-2, &
&       j)) + b3*(velx(i+3, j)-velx(i-3, j)) + b4*(velx(i+4, j)-velx(i-4&
&       , j))
      gvid = b1*(velyd(i+1, j)-velyd(i-1, j)) + b2*(velyd(i+2, j)-velyd(&
&       i-2, j)) + b3*(velyd(i+3, j)-velyd(i-3, j)) + b4*(velyd(i+4, j)-&
&       velyd(i-4, j))
      gvi = b1*(vely(i+1, j)-vely(i-1, j)) + b2*(vely(i+2, j)-vely(i-2, &
&       j)) + b3*(vely(i+3, j)-vely(i-3, j)) + b4*(vely(i+4, j)-vely(i-4&
&       , j))
      gwid = b1*(velzd(i+1, j)-velzd(i-1, j)) + b2*(velzd(i+2, j)-velzd(&
&       i-2, j)) + b3*(velzd(i+3, j)-velzd(i-3, j)) + b4*(velzd(i+4, j)-&
&       velzd(i-4, j))
      gwi = b1*(velz(i+1, j)-velz(i-1, j)) + b2*(velz(i+2, j)-velz(i-2, &
&       j)) + b3*(velz(i+3, j)-velz(i-3, j)) + b4*(velz(i+4, j)-velz(i-4&
&       , j))
!jdir
      gujd = b1*(velxd(i, j+1)-velxd(i, j-1)) + b2*(velxd(i, j+2)-velxd(&
&       i, j-2)) + b3*(velxd(i, j+3)-velxd(i, j-3)) + b4*(velxd(i, j+4)-&
&       velxd(i, j-4))
      guj = b1*(velx(i, j+1)-velx(i, j-1)) + b2*(velx(i, j+2)-velx(i, j-&
&       2)) + b3*(velx(i, j+3)-velx(i, j-3)) + b4*(velx(i, j+4)-velx(i, &
&       j-4))
      gvjd = b1*(velyd(i, j+1)-velyd(i, j-1)) + b2*(velyd(i, j+2)-velyd(&
&       i, j-2)) + b3*(velyd(i, j+3)-velyd(i, j-3)) + b4*(velyd(i, j+4)-&
&       velyd(i, j-4))
      gvj = b1*(vely(i, j+1)-vely(i, j-1)) + b2*(vely(i, j+2)-vely(i, j-&
&       2)) + b3*(vely(i, j+3)-vely(i, j-3)) + b4*(vely(i, j+4)-vely(i, &
&       j-4))
      gwjd = b1*(velzd(i, j+1)-velzd(i, j-1)) + b2*(velzd(i, j+2)-velzd(&
&       i, j-2)) + b3*(velzd(i, j+3)-velzd(i, j-3)) + b4*(velzd(i, j+4)-&
&       velzd(i, j-4))
      gwj = b1*(velz(i, j+1)-velz(i, j-1)) + b2*(velz(i, j+2)-velz(i, j-&
&       2)) + b3*(velz(i, j+3)-velz(i, j-3)) + b4*(velz(i, j+4)-velz(i, &
&       j-4))
      volm1 = one/vol(i, j)
      dxm1 = half*(nx(i, j, 1)+nx(i+1, j, 1))*volm1
      dxm2 = half*(nx(i, j, 2)+nx(i, j+1, 2))*volm1
      dym1 = half*(ny(i, j, 1)+ny(i+1, j, 1))*volm1
      dym2 = half*(ny(i, j, 2)+ny(i, j+1, 2))*volm1
      gradud(i, j, 1) = dxm1*guid + dxm2*gujd
      gradu(i, j, 1) = dxm1*gui + dxm2*guj
      gradvd(i, j, 1) = dxm1*gvid + dxm2*gvjd
      gradv(i, j, 1) = dxm1*gvi + dxm2*gvj
      gradwd(i, j, 1) = dxm1*gwid + dxm2*gwjd
      gradw(i, j, 1) = dxm1*gwi + dxm2*gwj
      gradud(i, j, 2) = dym1*guid + dym2*gujd
      gradu(i, j, 2) = dym1*gui + dym2*guj
      gradvd(i, j, 2) = dym1*gvid + dym2*gvjd
      gradv(i, j, 2) = dym1*gvi + dym2*gvj
      gradwd(i, j, 2) = dym1*gwid + dym2*gwjd
      gradw(i, j, 2) = dym1*gwi + dym2*gwj
    END DO
  END DO
! trick for ducros in dissipation
  DO i=1,2
    DO h=1,gh
      gradud(:, 1-h, :) = two*gradud(:, 2-h, :) - gradud(:, 3-h, :)
      gradu(:, 1-h, :) = two*gradu(:, 2-h, :) - gradu(:, 3-h, :)
      gradvd(:, 1-h, :) = two*gradvd(:, 2-h, :) - gradvd(:, 3-h, :)
      gradv(:, 1-h, :) = two*gradv(:, 2-h, :) - gradv(:, 3-h, :)
      gradwd(:, 1-h, :) = two*gradwd(:, 2-h, :) - gradwd(:, 3-h, :)
      gradw(:, 1-h, :) = two*gradw(:, 2-h, :) - gradw(:, 3-h, :)
      gradud(:, jm+h, :) = two*gradud(:, jm-1+h, :) - gradud(:, jm-2+h, &
&       :)
      gradu(:, jm+h, :) = two*gradu(:, jm-1+h, :) - gradu(:, jm-2+h, :)
      gradvd(:, jm+h, :) = two*gradvd(:, jm-1+h, :) - gradvd(:, jm-2+h, &
&       :)
      gradv(:, jm+h, :) = two*gradv(:, jm-1+h, :) - gradv(:, jm-2+h, :)
      gradwd(:, jm+h, :) = two*gradwd(:, jm-1+h, :) - gradwd(:, jm-2+h, &
&       :)
      gradw(:, jm+h, :) = two*gradw(:, jm-1+h, :) - gradw(:, jm-2+h, :)
      gradud(1-h, :, :) = two*gradud(2-h, :, :) - gradud(3-h, :, :)
      gradu(1-h, :, :) = two*gradu(2-h, :, :) - gradu(3-h, :, :)
      gradvd(1-h, :, :) = two*gradvd(2-h, :, :) - gradvd(3-h, :, :)
      gradv(1-h, :, :) = two*gradv(2-h, :, :) - gradv(3-h, :, :)
      gradwd(1-h, :, :) = two*gradwd(2-h, :, :) - gradwd(3-h, :, :)
      gradw(1-h, :, :) = two*gradw(2-h, :, :) - gradw(3-h, :, :)
      gradud(im+h, :, :) = two*gradud(im-1+h, :, :) - gradud(im-2+h, :, &
&       :)
      gradu(im+h, :, :) = two*gradu(im-1+h, :, :) - gradu(im-2+h, :, :)
      gradvd(im+h, :, :) = two*gradvd(im-1+h, :, :) - gradvd(im-2+h, :, &
&       :)
      gradv(im+h, :, :) = two*gradv(im-1+h, :, :) - gradv(im-2+h, :, :)
      gradwd(im+h, :, :) = two*gradwd(im-1+h, :, :) - gradwd(im-2+h, :, &
&       :)
      gradw(im+h, :, :) = two*gradw(im-1+h, :, :) - gradw(im-2+h, :, :)
    END DO
  END DO
  func0d = 0.0_8
  func1d = 0.0_8
  func2d = 0.0_8
  func3d = 0.0_8
  func4d = 0.0_8
  func5d = 0.0_8
  func6d = 0.0_8
  func7d = 0.0_8
  func8d = 0.0_8
  func9d = 0.0_8
  func10d = 0.0_8
  func11d = 0.0_8
  func12d = 0.0_8
  func13d = 0.0_8
  func14d = 0.0_8
  func15d = 0.0_8
  DO j=1,jm
!DIR$ IVDEP
    DO i=1,im
!
      func0d(i, j, 1) = wd(i, j, 4)
      func0d(i, j, 2) = velz(i, j)*wd(i, j, 2) + w(i, j, 2)*velzd(i, j) &
&       - gradw(i, j, 1)*mud(i, j) - mu(i, j)*gradwd(i, j, 1)
      func0d(i, j, 3) = velz(i, j)*wd(i, j, 3) + w(i, j, 3)*velzd(i, j) &
&       - gradw(i, j, 2)*mud(i, j) - mu(i, j)*gradwd(i, j, 2)
      temp = gradu(i, j, 1) + gradv(i, j, 2)
      func0d(i, j, 4) = velz(i, j)*wd(i, j, 4) + w(i, j, 4)*velzd(i, j) &
&       + pd(i, j) + twothird*(temp*mud(i, j)+mu(i, j)*(gradud(i, j, 1)+&
&       gradvd(i, j, 2)))
      temp = w(i, j, 5) + p(i, j)
      func0d(i, j, 5) = velz(i, j)*(wd(i, j, 5)+pd(i, j)) + temp*velzd(i&
&       , j)
      func1d(i, j, 1) = 0.0_8
      func1d(i, j, 2) = velzd(i, j)
      func1d(i, j, 3) = velzd(i, j)
      func1d(i, j, 4) = velxd(i, j)
      func1d(i, j, 5) = velzd(i, j)
      func2d(i, j, 1) = 0.0_8
      func2d(i, j, 2) = gradwd(i, j, 1)
      func2d(i, j, 3) = gradwd(i, j, 2)
      func2d(i, j, 4) = velyd(i, j)
      func2d(i, j, 5) = gradwd(i, j, 1)
      func3d(i, j, 1) = 0.0_8
      func3d(i, j, 2) = 0.0_8
      func3d(i, j, 3) = 0.0_8
      func3d(i, j, 4) = gradud(i, j, 1) + gradvd(i, j, 2)
      func3d(i, j, 5) = velxd(i, j)
      func4d(i, j, 1) = 0.0_8
      func4d(i, j, 2) = 0.0_8
      func4d(i, j, 3) = 0.0_8
      func4d(i, j, 4) = 0.0_8
      func4d(i, j, 5) = gradud(i, j, 1)
      func5d(i, j, 1) = 0.0_8
      func5d(i, j, 2) = 0.0_8
      func5d(i, j, 3) = 0.0_8
      func5d(i, j, 4) = 0.0_8
      func5d(i, j, 5) = velzd(i, j)
      func6d(i, j, 1) = 0.0_8
      func6d(i, j, 2) = 0.0_8
      func6d(i, j, 3) = 0.0_8
      func6d(i, j, 4) = 0.0_8
      func6d(i, j, 5) = gradwd(i, j, 2)
      func7d(i, j, 1) = 0.0_8
      func7d(i, j, 2) = 0.0_8
      func7d(i, j, 3) = 0.0_8
      func7d(i, j, 4) = 0.0_8
      func7d(i, j, 5) = velyd(i, j)
      func8d(i, j, 1) = 0.0_8
      func8d(i, j, 2) = 0.0_8
      func8d(i, j, 3) = 0.0_8
      func8d(i, j, 4) = 0.0_8
      func8d(i, j, 5) = gradvd(i, j, 2)
      func9d(i, j, 1) = 0.0_8
      func9d(i, j, 2) = 0.0_8
      func9d(i, j, 3) = 0.0_8
      func9d(i, j, 4) = 0.0_8
      func9d(i, j, 5) = velxd(i, j)
      func10d(i, j, 1) = 0.0_8
      func10d(i, j, 2) = 0.0_8
      func10d(i, j, 3) = 0.0_8
      func10d(i, j, 4) = 0.0_8
      func10d(i, j, 5) = gradw(i, j, 1)*mud(i, j) + mu(i, j)*gradwd(i, j&
&       , 1)
      func11d(i, j, 1) = 0.0_8
      func11d(i, j, 2) = 0.0_8
      func11d(i, j, 3) = 0.0_8
      func11d(i, j, 4) = 0.0_8
      func11d(i, j, 5) = velyd(i, j)
      func12d(i, j, 1) = 0.0_8
      func12d(i, j, 2) = 0.0_8
      func12d(i, j, 3) = 0.0_8
      func12d(i, j, 4) = 0.0_8
      func12d(i, j, 5) = gradw(i, j, 2)*mud(i, j) + mu(i, j)*gradwd(i, j&
&       , 2)
      func13d(i, j, 1) = 0.0_8
      func13d(i, j, 2) = 0.0_8
      func13d(i, j, 3) = 0.0_8
      func13d(i, j, 4) = 0.0_8
      func13d(i, j, 5) = velzd(i, j)
      func14d(i, j, 1) = 0.0_8
      func14d(i, j, 2) = 0.0_8
      func14d(i, j, 3) = 0.0_8
      func14d(i, j, 4) = 0.0_8
      func14d(i, j, 5) = mud(i, j)
      func15d(i, j, 1) = 0.0_8
      func15d(i, j, 2) = 0.0_8
      func15d(i, j, 3) = 0.0_8
      func15d(i, j, 4) = 0.0_8
      func15d(i, j, 5) = gradud(i, j, 1) + gradvd(i, j, 2)
    END DO
  END DO
END SUBROUTINE FUNCTION_9P_DZ_D
!
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
