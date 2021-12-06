<?php

declare(strict_types=1);

namespace DoctrineMigrations;

use Doctrine\DBAL\Schema\Schema;
use Doctrine\Migrations\AbstractMigration;

/**
 * Auto-generated Migration: Please modify to your needs!
 */
final class Version20211203143002 extends AbstractMigration
{
    public function getDescription(): string
    {
        return '';
    }

    public function up(Schema $schema): void
    {
        // this up() migration is auto-generated, please modify it to your needs
        $this->addSql('ALTER TABLE agences ADD CONSTRAINT FK_B46015DDAA95C5C1 FOREIGN KEY (structure_id_id) REFERENCES structures (id)');
        $this->addSql('ALTER TABLE contrat ADD CONSTRAINT FK_60349993BD95B80F FOREIGN KEY (bien_id) REFERENCES property (id)');
        $this->addSql('ALTER TABLE contrat ADD CONSTRAINT FK_60349993A76ED395 FOREIGN KEY (user_id) REFERENCES users (id)');
        $this->addSql('ALTER TABLE photo ADD CONSTRAINT FK_14B78418549213EC FOREIGN KEY (property_id) REFERENCES property (id)');
        $this->addSql('ALTER TABLE prisede_rdv CHANGE date_rdv date_rdv DATETIME NOT NULL');
        $this->addSql('CREATE UNIQUE INDEX UNIQ_D2D31865444F97DD ON prisede_rdv (phone)');
        $this->addSql('CREATE UNIQUE INDEX UNIQ_D2D31865A1CF58F3 ON prisede_rdv (date_rdv)');
        $this->addSql('ALTER TABLE users CHANGE roles roles LONGTEXT NOT NULL COMMENT \'(DC2Type:json)\'');
    }

    public function down(Schema $schema): void
    {
        // this down() migration is auto-generated, please modify it to your needs
        $this->addSql('ALTER TABLE agences DROP FOREIGN KEY FK_B46015DDAA95C5C1');
        $this->addSql('ALTER TABLE contrat DROP FOREIGN KEY FK_60349993BD95B80F');
        $this->addSql('ALTER TABLE contrat DROP FOREIGN KEY FK_60349993A76ED395');
        $this->addSql('ALTER TABLE photo DROP FOREIGN KEY FK_14B78418549213EC');
        $this->addSql('DROP INDEX UNIQ_D2D31865444F97DD ON prisede_rdv');
        $this->addSql('DROP INDEX UNIQ_D2D31865A1CF58F3 ON prisede_rdv');
        $this->addSql('ALTER TABLE prisede_rdv CHANGE date_rdv date_rdv DATE NOT NULL');
        $this->addSql('ALTER TABLE users CHANGE roles roles LONGTEXT CHARACTER SET utf8mb4 NOT NULL COLLATE `utf8mb4_bin`');
    }
}
