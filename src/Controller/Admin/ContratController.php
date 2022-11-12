<?php
declare(strict_types=1);

namespace App\Controller\Admin;

use App\Controller\BaseController;
use App\Entity\Contrat;
use App\Service\Admin\ContratService;
use App\Form\Type\ContratType;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\IsGranted;
use Symfony\Component\Form\ClickableInterface;
use Symfony\Component\Form\Extension\Core\Type\SubmitType;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;


final class ContratController extends BaseController
{
    /**
     * @Route("/admin/contrat", name="admin_contrat")
     */
    public function index(): Response
    {
        $repository = $this->getDoctrine()->getRepository(Contrat::class);

        $contrat = $repository->findAll();
        
        //dd($contrat);

        return $this->render('admin/contrat/index.html.twig', [
            'site' => $this->site(),
            'contrats' => $contrat,
            'controller_name' => 'Contrat',
        ]);
    }

    /**
     * @Route("/admin/contrat/new", name="admin_contrat_new")
     */
     public function new (Request $request, ContratService $service): Response
    {
        $contrat = new Contrat();

        $form = $this->createForm(ContratType::class, $contrat)
            ->add('saveAndCreateNew', SubmitType::class);
        $form->handleRequest($request);

         //dd($contrat);
         
        if ($form->isSubmitted() && $form->isValid()) {
            $service->create($contrat);

            //dd($contrat);
            
            /** @var ClickableInterface $button */
            $button = $form->get('saveAndCreateNew');
            if ($button->isClicked()) {
                
               // dd($contrat);
               
                return $this->redirectToRoute('admin_contrat_new');
            }
                ///dd($contrat);
            return $this->redirectToRoute('admin_contrat');
        }
        
        return $this->render('admin/contrat/new.html.twig', [
            'site' => $this->site(),
            'contrats' => $contrat,
            'form' => $form->createView(),
        ]);
    }

    /**
     * Displays a form to edit an existing Contrat entity.
     *
     * @Route("/admin/contrat/{id<\d+>}/edit",methods={"GET", "POST"}, name="admin_contrat_edit")
     */
    public function edit(Request $request, Contrat $contrat, ContratService $service): Response
    {
        $form = $this->createForm(ContratType::class, $contrat);
        $form->handleRequest($request);

        
        if ($form->isSubmitted() && $form->isValid()) {
            $service->update($contrat);

            return $this->redirectToRoute('admin_contrat');
        }
    

        return $this->render('admin/contrat/edit.html.twig', [
            'site' => $this->site(),
            'form' => $form->createView(),
        ]);
    }

   /**
     * Deletes a Contrat entity.
     *
     * @Route("/contrat{id<\d+>}/delete", methods={"POST"}, name="admin_contrat_delete")
     * @IsGranted("ROLE_ADMIN")
     */
    public function delete(Request $request, Contrat $contrat, ContratService $service): Response
    {
        if (!$this->isCsrfTokenValid('delete', $request->request->get('token'))) {
            return $this->redirectToRoute('admin_contrat');
        }

        
        $service->remove($contrat);

        return $this->redirectToRoute('admin_contrat');
    }

}