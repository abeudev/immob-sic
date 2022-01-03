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
    public function home(Request $request, PriseRdvService $service): Response
    {

        //dd($service);
        $priserdv = new PrisedeRDV();
        /*-id: null
  -fullname: null
  -phone: null
  -dateRdv: null*/
//dd($_POST);

$priserdv->setPhone($_POST['phone']);
$priserdv->setFullname($_POST['name']);

//$dateR=$_POST['rdvdate']->format('Y-m-d');

$dateR = new \DateTime($_POST['rdvdate'].' '.$_POST['heurerdv']);
//$newdate=$dateR->format('Y-m-d');
$priserdv->setDateRdv($dateR);

//$priserdv->setDateRdv(new \Date($_POST['rdvdate']));
//$priserdv->setDateRdv($_POST['rdvdate']);

$priserdv->setEmail($_POST['email']);
//dd($priserdv);
$service->create($priserdv);

        $form = $this->createForm(PriseRdvType::class, $priserdv);
        $form->handleRequest($request);
        if ($form->isSubmitted() && $form->isValid()) {
            $service->create($priserdv);
            return $this->redirectToRoute('property');
        }

        return $this->render('priserdv/new.html.twig', [
            'site' => $this->site(),
            'priserdv' => $priserdv,
            'form' => $form->createView(),
        ]);
    }
}
