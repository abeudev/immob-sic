<?php

declare(strict_types=1);

namespace App\Service;

use App\Entity\PrisedeRDV;
use App\Service\AbstractService;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Component\HttpFoundation\RequestStack;
use Symfony\Component\Security\Csrf\CsrfTokenManagerInterface;

final class PriseRdvService extends AbstractService {
    /**
     * @var EntityManagerInterface
     */
    private $em;

    public function __construct(
        CsrfTokenManagerInterface $tokenManager,
        RequestStack $requestStack,
        EntityManagerInterface $entityManager
    ) {
        parent::__construct($tokenManager, $requestStack);
        $this->em = $entityManager;
    }

    public function create(PrisedeRDV $priserdv): void
    {
        $this->save($priserdv);
        $this->clearCache('priserdv_count');
        $this->addFlash('success', 'message.created');
    }

     private function save(PrisedeRDV $priserdv): void
    {
        $this->em->persist($priserdv);
        $this->em->flush();
    }
}