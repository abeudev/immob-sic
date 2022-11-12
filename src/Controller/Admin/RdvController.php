<?php
declare(strict_types=1);

namespace App\Controller\Admin;

use App\Controller\BaseController;
use App\Entity\Rdv;
use App\Service\Admin\RdvService;
use App\Form\Type\RdvType;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\IsGranted;
use Symfony\Component\Form\ClickableInterface;
use Symfony\Component\Form\Extension\Core\Type\SubmitType;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;


final class RdvController extends BaseController
{
    /**
     * @Route("/admin/rdv", name="admin_rdv")
     */
    public function index(): Response
    {
        $repository = $this->getDoctrine()->getRepository(Rdv::class);

        $rdvs = $repository->findAll();

        return $this->render('admin/rdv/index.html.twig', [
            'site' => $this->site(),
            'rdvs' => $rdvs,
            'controller_name' => 'Rendez-vous',
        ]);
    }

    /**
     * @Route("/admin/rdv/new", name="admin_rdv_new")
     */
     public function new (Request $request, RdvService $service): Response
    {
        $rdv = new Rdv();

        $form = $this->createForm(RdvType::class, $rdv)
            ->add('saveAndCreateNew', SubmitType::class);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $service->create($rdv);

            /** @var ClickableInterface $button */
            $button = $form->get('saveAndCreateNew');
            if ($button->isClicked()) {
                return $this->redirectToRoute('admin_rdv_new');
            }
            return $this->redirectToRoute('admin_rdv');
        }
        
        return $this->render('admin/rdv/new.html.twig', [
            'site' => $this->site(),
            'rdv' => $rdv,
            'form' => $form->createView(),
        ]);
    }

    /**
     * Displays a form to edit an existing Rendez-vous entity.
     *
     * @Route("/admin/rdv/{id<\d+>}/edit",methods={"GET", "POST"}, name="admin_rdv_edit")
     */
    public function edit(Request $request, Rdv $rdv, RdvService $service): Response
    {
        $form = $this->createForm(RdvType::class, $rdv);
        $form->handleRequest($request);

        
        if ($form->isSubmitted() && $form->isValid()) {
            $service->update($rdv);
            return $this->redirectToRoute('admin_rdv');
        }
    
        return $this->render('admin/rdv/edit.html.twig', [
            'site' => $this->site(),
            'form' => $form->createView(),
        ]);
    }

   /**
     * Deletes a Rendez-vous entity.
     *
     * @Route("/rdv{id<\d+>}/delete", methods={"POST"}, name="admin_rdv_delete")
     * @IsGranted("ROLE_ADMIN")
     */
    public function delete(Request $request, Rdv $rdv, RdvService $service): Response
    {
        if (!$this->isCsrfTokenValid('delete', $request->request->get('token'))) {
            return $this->redirectToRoute('admin_rdv');
        }
        $service->remove($rdv);
        return $this->redirectToRoute('admin_rdv');
    }

}