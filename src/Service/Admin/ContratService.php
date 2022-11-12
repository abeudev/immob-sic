<?php

declare(strict_types=1);

namespace App\Service\Admin;

use App\Entity\Contrat;
use App\Service\AbstractService;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Component\HttpFoundation\RequestStack;
use Symfony\Component\Security\Csrf\CsrfTokenManagerInterface;


final class ContratService extends AbstractService
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

    public function create(Contrat $contrat): void
    {
        $this->save($contrat);
        $this->clearCache('contrat_count');
        $this->addFlash('success', 'message.created');
    }

     public function update(Contrat $contrat): void
    {
        $this->save($contrat);
        $this->addFlash('success', 'message.updated');
    }

    public function remove(Contrat $contrat): void
    {
        $this->em->remove($contrat);
        $this->em->flush();
        $this->clearCache('contrat_count');
        $this->addFlash('success', 'message.deleted');
    }

    private function save(Contrat $contrat): void
    {
        $this->em->persist($contrat);
        $this->em->flush();
    }
}