<?php

declare(strict_types=1);

namespace App\Controller;

use App\Entity\PrisedeRDV;
use App\Service\PriseRdvService;
use App\Form\Type\PriseRdvType;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\IsGranted;
use Symfony\Component\HttpFoundation\JsonResponse;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use App\Controller\BaseController;

final class PrisedeRDVController extends BaseController 
{
     /**
     * @Route("/interesse/new", name="interesse_new")
     */
    public function home(Request $request): Response
    {
        
        $priserdv = new PrisedeRDV();
          dd($_POST);
        $form = $this->createForm(PriseRdvType::class, $priserdv);
        $form->handleRequest($request);
        if ($form->isSubmitted() && $form->isValid()) {
            $service->create($priserdv);
            return $this->redirectToRoute('/');
        }
    
        return $this->render('priserdv/new.html.twig', [
            'site' => $this->site(),
            'priserdv' => $priserdv,
            'form' => $form->createView(),
        ]);
    }
}