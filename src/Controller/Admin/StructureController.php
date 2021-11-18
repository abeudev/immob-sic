<?php
declare(strict_types=1);


namespace App\Controller\Admin;

use App\Controller\BaseController;
use App\Entity\Structures;
use App\Service\Admin\StructureService;
use App\Form\Type\StructureType;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\IsGranted;
use Symfony\Component\Form\ClickableInterface;
use Symfony\Component\Form\Extension\Core\Type\SubmitType;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

final class StructureController extends BaseController
{
    /**
     * @Route("/admin/structure", name="admin_structures")
     */
    public function index(): Response
    {
        $repository = $this->getDoctrine()->getRepository(Structures::class);

        $structures = $repository->findAll();

        return $this->render('admin/structure/index.html.twig', [
            'site' => $this->site(),
            'structure' => $structures,
            'controller_name' => 'Structures',
        ]);
    }
    
    /**
     * @Route("/admin/structure/new", name="admin_structures_new")
     */
    public function new (Request $request, StructureService $service): Response
    {
        $structure = new Structures();

        $form = $this->createForm(StructureType::class, $structure)
            ->add('saveAndCreateNew', SubmitType::class);
        $form->handleRequest($request);

         //dd($structure);
        if ($form->isSubmitted() && $form->isValid()) {
            $service->create($structure);

            //dd($structure);
            
            /** @var ClickableInterface $button */
            $button = $form->get('saveAndCreateNew');
            if ($button->isClicked()) {
               // dd($structure);
                return $this->redirectToRoute('admin_structures_new');
            }
                ///dd($structure);
            return $this->redirectToRoute('admin_structures');
        }
        
        return $this->render('admin/structure/new.html.twig', [
            'site' => $this->site(),
            'deal_type' => $structure,
            'form' => $form->createView(),
        ]);
    }

    /**
     * Displays a form to edit an existing Structures entity.
     *
     * @Route("/admin/structure/{id<\d+>}/edit",methods={"GET", "POST"}, name="admin_structure_edit")
     */
    public function edit(Request $request, Structures $structure, StructureService $service): Response
    {
        $form = $this->createForm(StructureType::class, $structure);
        $form->handleRequest($request);

        
        if ($form->isSubmitted() && $form->isValid()) {
            $service->update($structure);

            return $this->redirectToRoute('admin_structures');
        }
    

        return $this->render('admin/structure/edit.html.twig', [
            'site' => $this->site(),
            'form' => $form->createView(),
        ]);
    }

    /**
     * Deletes a DealType entity.
     *
     * @Route("/structure{id<\d+>}/delete", methods={"POST"}, name="admin_structure_delete")
     * @IsGranted("ROLE_ADMIN")
     */
    public function delete(Request $request, Structures $structure, StructureService $service): Response
    {
        if (!$this->isCsrfTokenValid('delete', $request->request->get('token'))) {
            return $this->redirectToRoute('admin_structures');
        }

        $service->remove($structure);

        return $this->redirectToRoute('admin_structures');
    }
}