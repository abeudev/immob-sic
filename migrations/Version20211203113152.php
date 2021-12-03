<?php

declare(strict_types=1);

namespace DoctrineMigrations;

use Doctrine\DBAL\Schema\Schema;
use Doctrine\Migrations\AbstractMigration;

/**
 * Auto-generated Migration: Please modify to your needs!
 */
final class Version20211203113152 extends AbstractMigration
{
    public function getDescription(): string
    {
        return '';
    }

    public function up(Schema $schema): void
    {
        // this up() migration is auto-generated, please modify it to your needs
        $this->addSql('ALTER TABLE prisede_rdv CHANGE date_rdv date_rdv DATETIME NOT NULL');
        $this->addSql('CREATE UNIQUE INDEX UNIQ_D2D31865444F97DD ON prisede_rdv (phone)');
        $this->addSql('CREATE UNIQUE INDEX UNIQ_D2D31865A1CF58F3 ON prisede_rdv (date_rdv)');
    }

    public function down(Schema $schema): void
    {
        // this down() migration is auto-generated, please modify it to your needs
        $this->addSql('DROP INDEX UNIQ_D2D31865444F97DD ON prisede_rdv');
        $this->addSql('DROP INDEX UNIQ_D2D31865A1CF58F3 ON prisede_rdv');
        $this->addSql('ALTER TABLE prisede_rdv CHANGE date_rdv date_rdv DATE NOT NULL');
    }
}
