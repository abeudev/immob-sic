<?php

declare(strict_types=1);

namespace App\Form\Type;

use App\Entity\Structures;
use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;

final class StructureType extends AbstractType
{
    /**
     * {@inheritdoc}
     */
    public function buildForm(FormBuilderInterface $builder, array $options): void
    {
        $builder
            ->add('NumeroRegisteDeCommerce', null, [
                'attr' => [
                    'autofocus' => true,
                    'class' => 'form-control',
                ],
                'label' => 'Immatriculation au registre du commerce et des sociétés',
            ])
            ->add('libelle', null, [
                'attr' => [
                    'class' => 'form-control',
                ],
                'label' => 'Nom de la structure',
            ])
            ->add('adresse', null, [
                'attr' => [
                    'class' => 'form-control',
                ],
                'label' => 'adresse',
            ])
            ->add('contact', null, [
                'attr' => [
                    'class' => 'form-control',
                ],
                'label' => 'contact',
            ])
            ->add('email', null, [
                'attr' => [
                    'class' => 'form-control',
                ],
                'label' => 'email',
            ])
            ->add('siteWeb', null, [
                'attr' => [
                    'class' => 'form-control',
                ],
                'label' => 'site web',
            ]);
    }
}