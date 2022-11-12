<?php
declare(strict_types=1);

namespace App\Controller\Admin;

use App\Controller\BaseController;
use App\Entity\Vente;
use App\Service\Admin\VenteService;
use App\Form\Type\VenteType;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\IsGranted;
use Symfony\Component\Form\ClickableInterface;
use Symfony\Component\Form\Extension\Core\Type\SubmitType;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;


final class VenteController extends BaseController
{
    /**
     * @Route("/admin/vente", name="admin_vente")
     */
    public function index(): Response
    {
        $repository = $this->getDoctrine()->getRepository(Vente::class);

        $vente = $repository->findAll();
        
        ///dd($vente);

        return $this->render('admin/vente/index.html.twig', [
            'site' => $this->site(),
            'ventes' => $vente,
            'controller_name' => 'Vente',
        ]);
    }

    /**
     * @Route("/admin/vente/new", name="admin_vente_new")
     */
     public function new (Request $request, VenteService $service): Response
    {
        $vente = new Vente();

        $form = $this->createForm(VenteType::class, $vente)
            ->add('saveAndCreateNew', SubmitType::class);
        $form->handleRequest($request);

         ///dd($vente);
        if ($form->isSubmitted() && $form->isValid()) {
            $service->create($vente);

            ///dd($vente);
            
            /** @var ClickableInterface $button */
            $button = $form->get('saveAndCreateNew');
            if ($button->isClicked()) {
               ///dd($vente);
                return $this->redirectToRoute('admin_vente_new');
            }
                ///dd($vente);
            return $this->redirectToRoute('admin_vente');
        }
        
        return $this->render('admin/vente/new.html.twig', [
            'site' => $this->site(),
            'ventes' => $vente,
            'form' => $form->createView(),
        ]);
    }

    /**
     * Displays a form to edit an existing Vente entity.
     *
     * @Route("/admin/vente/{id<\d+>}/edit",methods={"GET", "POST"}, name="admin_vente_edit")
     */
    public function edit(Request $request, Vente $vente, VenteService $service): Response
    {
        $form = $this->createForm(VenteType::class, $vente);
        $form->handleRequest($request);

        
        if ($form->isSubmitted() && $form->isValid()) {
            $service->update($vente);

            return $this->redirectToRoute('admin_vente');
        }
    

        return $this->render('admin/vente/edit.html.twig', [
            'site' => $this->site(),
            'form' => $form->createView(),
        ]);
    }

   /**
     * Deletes a Vente entity.
     *
     * @Route("/vente{id<\d+>}/delete", methods={"POST"}, name="admin_vente_delete")
     * @IsGranted("ROLE_ADMIN")
     */
    public function delete(Request $request, Vente $vente, VenteService $service): Response
    {
        if (!$this->isCsrfTokenValid('delete', $request->request->get('token'))) {
            return $this->redirectToRoute('admin_vente');
        }

        $service->remove($vente);

        return $this->redirectToRoute('admin_vente');
    }

}