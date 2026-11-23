import LiveScripts.Shared
import LiveScripts.S_2d83cf9c43d533dea6946eee16d351253374c2c587ff76388501055c.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_2d83cf9c43d533dea6946eee16d351253374c2c587ff76388501055c.script [ctx] 10000]
