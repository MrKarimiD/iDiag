% Roles for diagonsting eye disease.
% Arash Kayhani && Mohammad Reza Karimi dastjerdi.

% top_goal where Native starts the inference.
top_goal(X) :- problem(X).

%===========Rule Base==============
problem(ab_morvarid) :-
do_bini,
tar_didan,
sephidi_mardomak.

problem(ab_syah) :-

kahesh_meidan_did,
dard_nagahani_cheshm,
didane_hale,
ghermezi_cheshm,
tahavoe,
estefragh,
mardomak_goshad,
feshar_chesh_bishtar_az_30mmhg.

problem(pir_cheshmi) :-
door_bini,
khastegi_cheshm,
age_is_more_than_60.

problem(enheraf_cheshm) :-
do_bini,
feghdan_dark_omghi,
khastegi_cheshm.

problem(belfarit) :-
soozesh,
ashk_rizesh,
ehsas_jesme_khareji,
pooste_pooste,
khoshki_ghermezi_labe.

problem(shalazion) :-
bimari_ofooni_pelk,
toode_sefid_rang,
mandane_toode_pelk_bishtar_az_3hafte.

problem(gol_mozhe) :-
bimari_ofooni_pelk,
toode_ghermez_rang.

problem(dodak) :-
harekat_zarbahangi.

problem(koor_rangi) :-
moshkel_tashkhis_rang.

problem(dejaksion_makola) :-
kahesh_meidan_did,
tar_didan,
lake_dar_markaz_did.

problem(electropion) :-
eltehab_pelk,
kharej_charkhidan_pelk,
khoshki_soozesh_cheshm.

problem(antripion) :-
chasbandegi_pelk,
tolide_cherk,
chasbandegi_mozhe,
eltehab_cheshm.

problem(magas_paran) :-
didan_zarat_ghobar_manand.

bimari_ofooni_pelk :-
eltehab_pelk,
sangini_pelk,
kharesh,
soozesh,
ashk_rizesh,
khrooj_mavad_cherki.

nazdik_bini :-
test_binaii_sanji(nazdikbin).

door_bini :-
test_binaii_sanji(doorbin).

do_bini :-
didan_do_tasvir_az_jesm.

eltehab_pelk :-
dard_pelk,
ghermezi_pelk,
tavarom_pelk.

eltehab_cheshm :-
dard_cheshm,
ghermezi_cheshm,
tavarom_cheshm,
ashk_rizesh.

%==============Questions===============
didan_do_tasvir_az_jesm :- ask(didan_do_tasvir_az_jesm).
tar_didan :- ask(tar_didan).
sephidi_mardomak :- ask(sephidi_mardomak).

kahesh_meidan_did :- ask(kahesh_meidan_did).
dard_nagahani_cheshm :- ask(dard_nagahani_cheshm).
didane_hale :- ask(didane_hale).
ghermezi_cheshm :- ask(ghermezi_cheshm).
tahavoe :- ask(tahavoe).
estefragh :- ask(estefragh).
mardomak_goshad :- ask(mardomak_goshad).
feshar_chesh_bishtar_az_30mmhg :- ask(feshar_chesh_bishtar_az_30mmhg).

test_binaii_sanji(X):- menuask(test_binaii_sanji, X, [doorbin, nazdikbin, none]).
khastegi_cheshm :- ask(khastegi_cheshm).
age_is_more_than_60 :- ask(age_is_more_than_60).

feghdan_dark_omghi :- ask(feghdan_dark_omghi).

soozesh :- ask(soozesh).
ashk_rizesh :- ask(ashk_rizesh).
ehsas_jesme_khareji :- ask(ehsas_jesme_khareji).
pooste_pooste :- ask(pooste_pooste).
khoshki_ghermezi_labe :- ask(khoshki_ghermezi_labe).

dard_pelk :- ask(dard_pelk).
ghermezi_pelk :- ask(ghermezi_pelk).
tavarom_pelk :- ask(tavarom_pelk).
sangini_pelk :- ask(sangini_pelk).
kharesh :- ask(kharesh).
khrooj_mavad_cherki :- ask(khrooj_mavad_cherki).
toode_sefid_rang :- ask(toode_sefid_rang).

toode_ghermez_rang :- ask(toode_ghermez_rang).

lake_dar_markaz_did :- ask(lake_dar_markaz_did).

harekat_zarbahangi :- ask(harekat_zarbahangi).

kharej_charkhidan_pelk :- ask(kharej_charkhidan_pelk).
khoshki_soozesh_cheshm :- ask(khoshki_soozesh_cheshm).

chasbandegi_pelk :- ask(chasbandegi_pelk).
tolide_cherk :- ask(tolide_cherk).
chasbandegi_mozhe :- ask(chasbandegi_mozhe).

moshkel_tashkhis_rang :- ask(moshkel_tashkhis_rang).

didan_zarat_ghobar_manand :- ask(didan_zarat_ghobar_manand).

mandane_toode_pelk_bishtar_az_3hafte :- ask(mandane_toode_pelk_bishtar_az_3hafte).
