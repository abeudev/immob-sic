<?php
declare(strict_types=1);

namespace App\Controller\Admin;

use App\Controller\BaseController;
use App\Entity\Agences;
use App\Service\Admin\AgenceService;
use App\Form\Type\AgenceType;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\IsGranted;
use Symfony\Component\Form\ClickableInterface;
use Symfony\Component\Form\Extension\Core\Type\SubmitType;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;


final class AgenceController extends BaseController
{
    /**
     * @Route("/admin/agence", name="admin_agences")
     */
    public function index(): Response
    {
        $repository = $this->getDoctrine()->getRepository(Agences::class);

        $agences = $repository->findAll();

        return $this->render('admin/agence/index.html.twig', [
            'site' => $this->site(),
            'agences' => $agences,
            'controller_name' => 'Agences',
        ]);
    }

    /**
     * @Route("/admin/agence/new", name="admin_agences_new")
     */
     public function new (Request $request, AgenceService $service): Response
    {
        $agences = new Agences();

        $form = $this->createForm(AgenceType::class, $agences)
            ->add('saveAndCreateNew', SubmitType::class);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $service->create($agences);

            /** @var ClickableInterface $button */
            $button = $form->get('saveAndCreateNew');
            if ($button->isClicked()) {
                return $this->redirectToRoute('admin_agences_new');
            }
            return $this->redirectToRoute('admin_agences');
        }
        
        return $this->render('admin/agence/new.html.twig', [
            'site' => $this->site(),
            'agences' => $agences,
            'form' => $form->createView(),
        ]);
    }

    /**
     * Displays a form to edit an existing Agences entity.
     *
     * @Route("/admin/agence/{id<\d+>}/edit",methods={"GET", "POST"}, name="admin_agence_edit")
     */
    public function edit(Request $request, Agences $agences, AgenceService $service): Response
    {
        $form = $this->createForm(AgenceType::class, $agences);
        $form->handleRequest($request);

        
        if ($form->isSubmitted() && $form->isValid()) {
            $service->update($agences);
            return $this->redirectToRoute('admin_agences');
        }
    
        return $this->render('admin/agence/edit.html.twig', [
            'site' => $this->site(),
            'form' => $form->createView(),
        ]);
    }

   /**
     * Deletes a Agence entity.
     *
     * @Route("/agence{id<\d+>}/delete", methods={"POST"}, name="admin_agence_delete")
     * @IsGranted("ROLE_ADMIN")
     */
    public function delete(Request $request, Agences $agences, AgenceService $service): Response
    {
        if (!$this->isCsrfTokenValid('delete', $request->request->get('token'))) {
            return $this->redirectToRoute('admin_agences');
        }
        $service->remove($agences);
        return $this->redirectToRoute('admin_agences');
    }

}