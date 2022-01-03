<?php

declare(strict_types=1);

namespace App\Service\Admin;

use App\Entity\Vente;
use App\Service\AbstractService;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Component\HttpFoundation\RequestStack;
use Symfony\Component\Security\Csrf\CsrfTokenManagerInterface;


final class VenteService extends AbstractService
{
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

    public function create(Vente $vente): void
    {
        $this->save($vente);
        $this->clearCache('vente_count');
        $this->addFlash('success', 'message.created');
    }

     public function update(Vente $vente): void
    {
        $this->save($vente);
        $this->addFlash('success', 'message.updated');
    }

    public function remove(Vente $vente): void
    {
        $this->em->remove($vente);
        $this->em->flush();
        $this->clearCache('vente_count');
        $this->addFlash('success', 'message.deleted');
    }

    private function save(Vente $vente): void
    {
        $this->em->persist($vente);
        $this->em->flush();
    }
}