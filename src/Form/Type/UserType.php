<?php

declare(strict_types=1);

namespace App\Form\Type;

use App\Entity\User;
use App\Entity\Agences;
use Symfony\Component\Form\AbstractType;
use Symfony\Bridge\Doctrine\Form\Type\EntityType;
use Symfony\Component\Form\Extension\Core\Type\ChoiceType;
use Symfony\Component\Form\Extension\Core\Type\PasswordType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;

final class UserType extends AbstractType
{
    /**
     * {@inheritdoc}
     */
    public function buildForm(FormBuilderInterface $builder, array $options): void
    {
        $builder
            ->add(
                'roles', ChoiceType::class, [
                    'choices' => [
                        'label.roles.admin' => 'ROLE_ADMIN',
                    ],
                    'expanded' => true,
                    'multiple' => true,
                    'label' => false,
                    'label_attr' => ['class' => 'switch-custom'],
                ]
            )
            ->add('AgenceId', EntityType::class, [
                'class' => Agences::class,
                'choice_label' => 'libelle',
                'label' => 'Agence',
            ])
            ->add('username', null, [
                'label' => 'label.username',
            ])
            ->add('profile', ProfileType::class)
            ->add('email', null, [
                'label' => 'label.email',
            ])
            ->add('password', PasswordType::class, [
                'label' => 'label.password',
            ]);
    }

    /**
     * {@inheritdoc}
     */
    public function configureOptions(OptionsResolver $resolver): void
    {
        $resolver->setDefaults([
            'data_class' => User::class,
        ]);
    }
}